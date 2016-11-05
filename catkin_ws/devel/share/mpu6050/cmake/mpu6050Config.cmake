# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(mpu6050_CONFIG_INCLUDED)
  return()
endif()
set(mpu6050_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("TRUE" STREQUAL "TRUE")
  set(mpu6050_SOURCE_PREFIX /home/ahmed/catkin_ws/src/mpu6050)
  set(mpu6050_DEVEL_PREFIX /home/ahmed/catkin_ws/devel)
  set(mpu6050_INSTALL_PREFIX "")
  set(mpu6050_PREFIX ${mpu6050_DEVEL_PREFIX})
else()
  set(mpu6050_SOURCE_PREFIX "")
  set(mpu6050_DEVEL_PREFIX "")
  set(mpu6050_INSTALL_PREFIX /home/ahmed/catkin_ws/install)
  set(mpu6050_PREFIX ${mpu6050_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'mpu6050' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(mpu6050_FOUND_CATKIN_PROJECT TRUE)

if(NOT "/home/ahmed/catkin_ws/src/mpu6050/include;/opt/ros/kinetic/include;/usr/include " STREQUAL " ")
  set(mpu6050_INCLUDE_DIRS "")
  set(_include_dirs "/home/ahmed/catkin_ws/src/mpu6050/include;/opt/ros/kinetic/include;/usr/include")
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${mpu6050_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'mpu6050' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  Ask the maintainer 'ahmed <ahmed@todo.todo>' to fix it.")
      endif()
    else()
      message(FATAL_ERROR "Project 'mpu6050' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '/home/ahmed/catkin_ws/src/mpu6050/${idir}'.  Ask the maintainer 'ahmed <ahmed@todo.todo>' to fix it.")
    endif()
    _list_append_unique(mpu6050_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "/home/ahmed/catkin_ws/devel/lib/libmpu6050.so;/opt/ros/kinetic/lib/libroscpp.so;/usr/lib/arm-linux-gnueabihf/libboost_signals.so;/usr/lib/arm-linux-gnueabihf/libboost_filesystem.so;/opt/ros/kinetic/lib/librosconsole.so;/opt/ros/kinetic/lib/librosconsole_log4cxx.so;/opt/ros/kinetic/lib/librosconsole_backend_interface.so;/usr/lib/arm-linux-gnueabihf/liblog4cxx.so;/usr/lib/arm-linux-gnueabihf/libboost_regex.so;/opt/ros/kinetic/lib/libxmlrpcpp.so;/opt/ros/kinetic/lib/libroscpp_serialization.so;/opt/ros/kinetic/lib/librostime.so;/opt/ros/kinetic/lib/libcpp_common.so;/usr/lib/arm-linux-gnueabihf/libboost_system.so;/usr/lib/arm-linux-gnueabihf/libboost_thread.so;/usr/lib/arm-linux-gnueabihf/libboost_chrono.so;/usr/lib/arm-linux-gnueabihf/libboost_date_time.so;/usr/lib/arm-linux-gnueabihf/libboost_atomic.so;/usr/lib/arm-linux-gnueabihf/libpthread.so;/usr/lib/arm-linux-gnueabihf/libconsole_bridge.so;mpu6050")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND mpu6050_LIBRARIES ${library})
  elseif(TARGET ${library})
    list(APPEND mpu6050_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND mpu6050_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/ahmed/catkin_ws/devel/lib;/home/ahmed/catkin_ws/devel/lib;/opt/ros/kinetic/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(mpu6050_LIBRARY_DIRS ${lib_path})
      list(APPEND mpu6050_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'mpu6050'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND mpu6050_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(mpu6050_EXPORTED_TARGETS "roscpp_generate_messages_cpp;roscpp_generate_messages_eus;roscpp_generate_messages_lisp;roscpp_generate_messages_nodejs;roscpp_generate_messages_py;rosgraph_msgs_generate_messages_cpp;rosgraph_msgs_generate_messages_eus;rosgraph_msgs_generate_messages_lisp;rosgraph_msgs_generate_messages_nodejs;rosgraph_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;sensor_msgs_generate_messages_cpp;sensor_msgs_generate_messages_eus;sensor_msgs_generate_messages_lisp;sensor_msgs_generate_messages_nodejs;sensor_msgs_generate_messages_py;geometry_msgs_generate_messages_cpp;geometry_msgs_generate_messages_eus;geometry_msgs_generate_messages_lisp;geometry_msgs_generate_messages_nodejs;geometry_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;roscpp_generate_messages_cpp;roscpp_generate_messages_eus;roscpp_generate_messages_lisp;roscpp_generate_messages_nodejs;roscpp_generate_messages_py;rosgraph_msgs_generate_messages_cpp;rosgraph_msgs_generate_messages_eus;rosgraph_msgs_generate_messages_lisp;rosgraph_msgs_generate_messages_nodejs;rosgraph_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;sensor_msgs_generate_messages_cpp;sensor_msgs_generate_messages_eus;sensor_msgs_generate_messages_lisp;sensor_msgs_generate_messages_nodejs;sensor_msgs_generate_messages_py;geometry_msgs_generate_messages_cpp;geometry_msgs_generate_messages_eus;geometry_msgs_generate_messages_lisp;geometry_msgs_generate_messages_nodejs;geometry_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;roscpp_generate_messages_cpp;roscpp_generate_messages_eus;roscpp_generate_messages_lisp;roscpp_generate_messages_nodejs;roscpp_generate_messages_py;rosgraph_msgs_generate_messages_cpp;rosgraph_msgs_generate_messages_eus;rosgraph_msgs_generate_messages_lisp;rosgraph_msgs_generate_messages_nodejs;rosgraph_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;sensor_msgs_generate_messages_cpp;sensor_msgs_generate_messages_eus;sensor_msgs_generate_messages_lisp;sensor_msgs_generate_messages_nodejs;sensor_msgs_generate_messages_py;geometry_msgs_generate_messages_cpp;geometry_msgs_generate_messages_eus;geometry_msgs_generate_messages_lisp;geometry_msgs_generate_messages_nodejs;geometry_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;roscpp_generate_messages_cpp;roscpp_generate_messages_eus;roscpp_generate_messages_lisp;roscpp_generate_messages_nodejs;roscpp_generate_messages_py;rosgraph_msgs_generate_messages_cpp;rosgraph_msgs_generate_messages_eus;rosgraph_msgs_generate_messages_lisp;rosgraph_msgs_generate_messages_nodejs;rosgraph_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;sensor_msgs_generate_messages_cpp;sensor_msgs_generate_messages_eus;sensor_msgs_generate_messages_lisp;sensor_msgs_generate_messages_nodejs;sensor_msgs_generate_messages_py;geometry_msgs_generate_messages_cpp;geometry_msgs_generate_messages_eus;geometry_msgs_generate_messages_lisp;geometry_msgs_generate_messages_nodejs;geometry_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;roscpp_generate_messages_cpp;roscpp_generate_messages_eus;roscpp_generate_messages_lisp;roscpp_generate_messages_nodejs;roscpp_generate_messages_py;rosgraph_msgs_generate_messages_cpp;rosgraph_msgs_generate_messages_eus;rosgraph_msgs_generate_messages_lisp;rosgraph_msgs_generate_messages_nodejs;rosgraph_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;sensor_msgs_generate_messages_cpp;sensor_msgs_generate_messages_eus;sensor_msgs_generate_messages_lisp;sensor_msgs_generate_messages_nodejs;sensor_msgs_generate_messages_py;geometry_msgs_generate_messages_cpp;geometry_msgs_generate_messages_eus;geometry_msgs_generate_messages_lisp;geometry_msgs_generate_messages_nodejs;geometry_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;roscpp_generate_messages_cpp;roscpp_generate_messages_eus;roscpp_generate_messages_lisp;roscpp_generate_messages_nodejs;roscpp_generate_messages_py;rosgraph_msgs_generate_messages_cpp;rosgraph_msgs_generate_messages_eus;rosgraph_msgs_generate_messages_lisp;rosgraph_msgs_generate_messages_nodejs;rosgraph_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;sensor_msgs_generate_messages_cpp;sensor_msgs_generate_messages_eus;sensor_msgs_generate_messages_lisp;sensor_msgs_generate_messages_nodejs;sensor_msgs_generate_messages_py;geometry_msgs_generate_messages_cpp;geometry_msgs_generate_messages_eus;geometry_msgs_generate_messages_lisp;geometry_msgs_generate_messages_nodejs;geometry_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py;std_msgs_generate_messages_cpp;std_msgs_generate_messages_eus;std_msgs_generate_messages_lisp;std_msgs_generate_messages_nodejs;std_msgs_generate_messages_py")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${mpu6050_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "rosconsole;roscpp;rospy;sensor_msgs;std_msgs")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 mpu6050_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${mpu6050_dep}_FOUND)
      find_package(${mpu6050_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${mpu6050_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(mpu6050_INCLUDE_DIRS ${${mpu6050_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(mpu6050_LIBRARIES ${mpu6050_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${mpu6050_dep}_LIBRARIES})
  _list_append_deduplicate(mpu6050_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(mpu6050_LIBRARIES ${mpu6050_LIBRARIES})

  _list_append_unique(mpu6050_LIBRARY_DIRS ${${mpu6050_dep}_LIBRARY_DIRS})
  list(APPEND mpu6050_EXPORTED_TARGETS ${${mpu6050_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${mpu6050_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
