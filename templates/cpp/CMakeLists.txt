cmake_minimum_required(VERSION 3.13.4)
enable_testing()
set(CMAKE_CXX_STANDARD 14)

set(MAIN_NAME template)
project(${MAIN_NAME})

file(GLOB_RECURSE SOURCES src/*.cpp)

include_directories(include)
add_executable(${MAIN_NAME} ${SOURCES})

# -------------------- gtest --------------------
configure_file(CMakeLists.txt.in googletest-download/CMakeLists.txt)
execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/googletest-download )
if(result)
  message(FATAL_ERROR "CMake step for googletest failed: ${result}")
endif()
execute_process(COMMAND ${CMAKE_COMMAND} --build .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/googletest-download )
if(result)
  message(FATAL_ERROR "Build step for googletest failed: ${result}")
endif()

set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

add_subdirectory(${CMAKE_CURRENT_BINARY_DIR}/googletest-src
                 ${CMAKE_CURRENT_BINARY_DIR}/googletest-build
                 EXCLUDE_FROM_ALL)


function(_test test_file)
  get_filename_component(test_target_name ${test_file} NAME_WE)

  add_executable(${test_target_name} ${test_file})
  target_link_libraries(${test_target_name} gtest_main)
  add_test(NAME ${test_target_name} COMMAND ${test_target_name})
endfunction()

_test("test/test.cpp")
