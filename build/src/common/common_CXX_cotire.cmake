# cotire.cmake 1.7.10 generated file
# /Users/qygame2/Documents/work/serverTest/fistServer/gameserver/build/src/common/common_CXX_cotire.cmake
set (COTIRE_ADDITIONAL_PREFIX_HEADER_IGNORE_EXTENSIONS "inc;inl;ipp")
set (COTIRE_ADDITIONAL_PREFIX_HEADER_IGNORE_PATH "")
set (COTIRE_CLEAN_ALL_TARGET_NAME "clean_cotire")
set (COTIRE_CLEAN_TARGET_SUFFIX "_clean_cotire")
set (COTIRE_CMAKE_MODULE_FILE "/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/dep/cotire/CMake/cotire.cmake")
set (COTIRE_CMAKE_MODULE_VERSION "1.7.10")
set (COTIRE_DEBUG "OFF")
set (COTIRE_INTDIR "cotire")
set (COTIRE_MAXIMUM_NUMBER_OF_UNITY_INCLUDES "0")
set (COTIRE_MINIMUM_NUMBER_OF_TARGET_SOURCES "3")
set (COTIRE_PCH_ALL_TARGET_NAME "all_pch")
set (COTIRE_PCH_TARGET_SUFFIX "_pch")
set (COTIRE_PREFIX_HEADER_FILENAME_SUFFIX "_prefix")
set (COTIRE_TARGETS_FOLDER "cotire")
set (COTIRE_TARGET_COMPILE_DEFINITIONS_DEBUG "TRINITY_API_EXPORT_COMMON;BOOST_DATE_TIME_NO_LIB;BOOST_REGEX_NO_LIB;BOOST_CHRONO_NO_LIB;BOOST_CONFIG_SUPPRESS_OUTDATED_MESSAGE;BOOST_ASIO_NO_DEPRECATED;FMT_USE_OVERRIDE;FMT_USE_VARIADIC_TEMPLATES;FMT_USE_RVALUE_REFERENCES;FMT_USE_DELETED_FUNCTIONS;FMT_USE_EXTERN_TEMPLATES;_BUILD_DIRECTIVE=\"Debug\"")
set (COTIRE_TARGET_COMPILE_FLAGS_DEBUG "-g;-Wno-narrowing;-Wno-deprecated-register;-std=gnu++14")
set (COTIRE_TARGET_CONFIGURATION_TYPES "Debug")
set (COTIRE_TARGET_CXX_COMPILER_LAUNCHER "COTIRE_TARGET_CXX_COMPILER_LAUNCHER-NOTFOUND")
set (COTIRE_TARGET_IGNORE_PATH "/Users/qygame2/Documents/work/serverTest/fistServer/gameserver")
set (COTIRE_TARGET_INCLUDE_DIRECTORIES_DEBUG "/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/build;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Asio;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Configuration;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Cryptography;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Cryptography/Authentication;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/DataStores;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Debugging;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Logging;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Platform;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Threading;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Utilities;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/build/src/common;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/dep/process;/usr/local/include;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/dep/fmt;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/dep/SFMT;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/dep/utf8cpp;/usr/local/opt/openssl/include")
set (COTIRE_TARGET_INCLUDE_PRIORITY_PATH "")
set (COTIRE_TARGET_LANGUAGE "CXX")
set (COTIRE_TARGET_MAXIMUM_NUMBER_OF_INCLUDES "")
set (COTIRE_TARGET_POST_UNDEFS "")
set (COTIRE_TARGET_PRE_UNDEFS "")
set (COTIRE_TARGET_SOURCES "/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Common.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/GitRevision.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Configuration/BuiltInConfig.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Configuration/Config.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Cryptography/ARC4.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Cryptography/BigNumber.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Cryptography/HmacHash.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Cryptography/OpenSSLCrypto.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Cryptography/RSA.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Cryptography/SHA1.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Cryptography/SHA256.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Cryptography/Authentication/PacketCrypt.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Cryptography/Authentication/WorldPacketCrypt.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/DataStores/DB2FileLoader.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/DataStores/DB2FileSystemSource.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/DataStores/DB2Meta.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Logging/Appender.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Logging/AppenderConsole.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Logging/AppenderFile.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Logging/Log.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Logging/LogMessage.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Logging/LogOperation.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Logging/Logger.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Threading/ProcessPriority.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Utilities/EventMap.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Utilities/EventProcessor.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Utilities/Random.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Utilities/StartProcess.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Utilities/TaskScheduler.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Utilities/Util.cpp;/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/src/common/Debugging/Errors.cpp")
set (COTIRE_UNITY_BUILD_ALL_TARGET_NAME "all_unity")
set (COTIRE_UNITY_BUILD_TARGET_SUFFIX "_unity")
set (COTIRE_UNITY_OUTPUT_DIRECTORY "")
set (COTIRE_UNITY_SOURCE_EXCLUDE_EXTENSIONS "m;mm")
set (COTIRE_UNITY_SOURCE_FILENAME_SUFFIX "_unity")
set (CMAKE_GENERATOR "Unix Makefiles")
set (CMAKE_BUILD_TYPE "Debug")
set (CMAKE_CXX_COMPILER_ID "AppleClang")
set (CMAKE_CXX_COMPILER_VERSION "10.0.0.10001145")
set (CMAKE_CXX_COMPILER "/usr/bin/clang++")
set (CMAKE_CXX_COMPILER_ARG1 "")
set (CMAKE_INCLUDE_FLAG_CXX "-I")
set (CMAKE_INCLUDE_SYSTEM_FLAG_CXX "-isystem ")
set (CMAKE_CXX_FRAMEWORK_SEARCH_FLAG "-F")
set (CMAKE_CXX_SYSTEM_FRAMEWORK_SEARCH_FLAG "-iframework ")
set (CMAKE_CXX_SOURCE_FILE_EXTENSIONS "C;M;c++;cc;cpp;cxx;mm;CPP")
