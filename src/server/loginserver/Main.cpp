
#include "Config.h"
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
