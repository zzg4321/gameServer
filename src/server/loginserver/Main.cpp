
#include "Config.h"
#include "GitRevision.h"
#include "AppenderDB.h"
#include "RealmList.h"
#include "SessionManager.h"
#include "SslContext.h"
#include "Util.h"
#include "DatabaseEnv.h"
#include "DatabaseLoader.h"
#include "MySQLThreading.h"
#include <boost/asio/signal_set.hpp>
#include <boost/program_options.hpp>
#include <boost/filesystem/operations.hpp>
#include <google/protobuf/stubs/common.h>
#include <iostream>
#include <csignal>

using boost::asio::ip::tcp;
using namespace boost::program_options;
namespace fs = boost::filesystem;

#ifndef _TRINITY_BNET_CONFIG
# define _TRINITY_BNET_CONFIG  "loginserver.conf"
#endif


#if TRINITY_PLATFORM == TRINITY_PLATFORM_WINDOWS
#include "ServiceWin32.h"
char serviceName[] = "loginserver";
char serviceLongName[] = "TrinityCore bnet service";
char serviceDescription[] = "TrinityCore Battle.net emulator authentication service";
/*
 * -1 - not in service mode
 *  0 - stopped
 *  1 - running
 *  2 - paused
 */
int m_ServiceStatus = -1;

void ServiceStatusWatcher(std::weak_ptr<boost::asio::deadline_timer> serviceStatusWatchTimerRef, std::weak_ptr<Trinity::Asio::IoContext> ioContextRef, boost::system::error_code const& error);
#endif
variables_map GetConsoleArguments(int argc, char** argv, fs::path& configFile, std::string& configService);
bool StartDB();
void StopDB();

int main(int argc, char** argv)
{
    printf("enter main\n");
    auto configFile = fs::absolute(_TRINITY_BNET_CONFIG);
    std::string configService;
    auto vm = GetConsoleArguments(argc, argv, configFile, configService);
    
    GOOGLE_PROTOBUF_VERIFY_VERSION;
    
    std::shared_ptr<void> protobufHandle(nullptr, [](void*) {
        printf("i test what\n");
        google::protobuf::ShutdownProtobufLibrary(); });
    
    
    std::string configError;
    if (!sConfigMgr->LoadInitial(configFile.generic_string(),
                                 std::vector<std::string>(argv, argv + argc),
                                 configError))
    {
        printf("Error in config file: %s\n", configError.c_str());
        return 1;
    }
    sLog->RegisterAppender<AppenderDB>();
    sLog->Initialize(nullptr);
    TC_LOG_INFO("realmlist","log Initialize");
    
    // bnetserver PID file creation
    std::string pidFile = sConfigMgr->GetStringDefault("PidFile", "");
    if (!pidFile.empty())
    {
        if (uint32 pid = CreatePIDFile(pidFile))
            TC_LOG_INFO("server.bnetserver", "Daemon PID: %u\n", pid);
        else
        {
            TC_LOG_ERROR("server.bnetserver", "Cannot create PID file %s.\n", pidFile.c_str());
            return 1;
        }
    }
    
    if (!StartDB())
        return 1;
    std::shared_ptr<void> dbHandle(nullptr, [](void*) { StopDB(); });
    std::shared_ptr<Trinity::Asio::IoContext> ioContext = std::make_shared<Trinity::Asio::IoContext>();
    
    int32 bnport = sConfigMgr->GetIntDefault("BattlenetPort", 1119);
    if (bnport < 0 || bnport > 0xFFFF)
    {
        TC_LOG_ERROR("server.bnetserver", "Specified battle.net port (%d) out of allowed range (1-65535)", bnport);
        return 1;
    }
    
    if (!sLoginService.Start(ioContext.get()))
    {
        TC_LOG_ERROR("server.bnetserver", "Failed to initialize login service");
        return 1;
    }
    
    std::shared_ptr<void> sLoginServiceHandle(nullptr, [](void*) { sLoginService.Stop(); });
    
    // Get the list of realms for the server
    sRealmList->Initialize(*ioContext, sConfigMgr->GetIntDefault("RealmsStateUpdateDelay", 20));
    TC_LOG_INFO("realmlist","sRealmList Initialize");
    std::shared_ptr<void> sRealmListHandle(nullptr, [](void*) { sRealmList->Close(); });
    
    
    printf("ioContext->run\n");
    
    ioContext->run();
    printf("exit main\n");
    return 0;
}
variables_map GetConsoleArguments(int argc, char** argv, fs::path& configFile, std::string& configService)
{
    (void)configService;
    
    options_description all("Allowed options");
    all.add_options()
    ("help,h", "print usage message")
    ("version,v", "print version build info")
    ("config,c", value<fs::path>(&configFile)->default_value(fs::absolute(_TRINITY_BNET_CONFIG)),
     "use <arg> as configuration file")
    ;
#if TRINITY_PLATFORM == TRINITY_PLATFORM_WINDOWS
    options_description win("Windows platform specific options");
    win.add_options()
    ("service,s", value<std::string>(&configService)->default_value(""), "Windows service options: [install | uninstall]")
    ;
    
    all.add(win);
#endif
    variables_map variablesMap;
    try
    {
        store(command_line_parser(argc, argv).options(all).allow_unregistered().run(), variablesMap);
        notify(variablesMap);
    }
    catch (std::exception& e)
    {
        std::cerr << e.what() << "\n";
    }
    
    if (variablesMap.count("help"))
    {
        std::cout << all << "\n";
    }
    else if (variablesMap.count("version"))
    {
        std::cout << GitRevision::GetFullVersion() << "\n";
    }
    
    return variablesMap;
}
bool StartDB()
{
    MySQL::Library_Init();
    
    // Load databases
    DatabaseLoader loader("server.loginserver", DatabaseLoader::DATABASE_NONE);
    loader
    .AddDatabase(LoginDatabase, "Login");
    
    if (!loader.Load())
        return false;
    
    TC_LOG_INFO("server.bnetserver", "Started auth database connection pool.");
    sLog->SetRealmId(0); // Enables DB appenders when realm is set.
    return true;
}
void StopDB()
{
    LoginDatabase.Close();
    MySQL::Library_End();
}
