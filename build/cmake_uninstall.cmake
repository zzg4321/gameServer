# from cmake wiki
IF(NOT EXISTS "/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/build/install_manifest.txt")
  MESSAGE(FATAL_ERROR "Cannot find install manifest: \"/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/build/install_manifest.txt\"")
ENDIF(NOT EXISTS "/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/build/install_manifest.txt")

FILE(READ "/Users/qygame2/Documents/work/serverTest/fistServer/gameserver/build/install_manifest.txt" files)
STRING(REGEX REPLACE "\n" ";" files "${files}")
FOREACH(file ${files})
  MESSAGE(STATUS "Uninstalling \"${file}\"")
  IF(EXISTS "${file}")
    EXEC_PROGRAM(
      "/usr/local/Cellar/cmake/3.12.2/bin/cmake" ARGS "-E remove \"${file}\""
      OUTPUT_VARIABLE rm_out
      RETURN_VALUE rm_retval
      )
    IF("${rm_retval}" STREQUAL 0)
    ELSE("${rm_retval}" STREQUAL 0)
      MESSAGE(FATAL_ERROR "Problem when removing \"${file}\"")
    ENDIF("${rm_retval}" STREQUAL 0)
  ELSE(EXISTS "${file}")
    MESSAGE(STATUS "File \"${file}\" does not exist.")
  ENDIF(EXISTS "${file}")
ENDFOREACH(file)
