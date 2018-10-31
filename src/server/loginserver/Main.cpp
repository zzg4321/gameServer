
#include "Config.h"
#include "GitRevision.h"

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
char serviceName[] = "bnetserver";
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
