cmake_minimum_required(VERSION 3.27.0)

set(VERSION "0.0.1")
set(PROJECT_NAME "myProject")
project(
  ${PROJECT_NAME}
  LANGUAGES CXX C
  VERSION ${VERSION})
set(BINARY_DIR bin)
set(INCLUDE_DIR include)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
add_compile_definitions(VERSION="${VERSION}")
add_compile_definitions(PROJECT_NAME="${PROJECT_NAME}")

# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17")

set(CMAKE_CXX_FLAGS_DEBUG "-g -D DEBUG")

# include files
file(GLOB_RECURSE SOURCES ${INCLUDE_DIR}/*.c ${INCLUDE_DIR}/*.cpp)
file(GLOB_RECURSE HEADERS ${INCLUDE_DIR}/*.h ${INCLUDE_DIR}/*.hpp)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

include(CPack)
find_package(Boost COMPONENTS)

include(FetchContent)

FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/refs/tags/v1.14.0.zip)
set(gtest_force_shared_crt
    ON
    CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

set(LIBS ${LIBS} ${Boost_LIBRARIES} -lpthread)
add_executable(${PROJECT_NAME} main.cpp ${SOURCES})

target_include_directories(${PROJECT_NAME} PUBLIC ${Boost_INCLUDE_DIRS})
target_include_directories(${PROJECT_NAME} PRIVATE ${DOCTEST_INCLUDE_DIR}
                                                   ${INCLUDE_DIR})
target_link_libraries(${PROJECT_NAME} ${LIBS})

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_VERBOSE_MAKEFILE ON)

set(EXECUTABLE_OUTPUT_PATH ../${BINARY_DIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ../${BINARY_DIR})

enable_testing()

set(TESTS_DIR "tests")
file(GLOB TEST_SOURCES ${TESTS_DIR}/*.cpp ${TESTS_DIR}/**/*.cpp
     ${TESTS_DIR}/*.c ${TESTS_DIR}/**/*.c)
foreach(TEST_SOURCE ${TEST_SOURCES})
  # string(REGEX REPLACE "^.*/" "" TEST_NAME ${TEST_SOURCE} )
  string(REGEX REPLACE ".+/(.+)\\..+" "\\1" TEST_NAME ${TEST_SOURCE})
  add_executable(${TEST_NAME} ${TEST_SOURCE} ${SOURCES})
  target_include_directories(${TEST_NAME} PUBLIC ${Boost_INCLUDE_DIRS})
  target_include_directories(${TEST_NAME} PRIVATE ${INCLUDE_DIR})

  target_link_libraries(${TEST_NAME} GTest::gtest_main ${LIBS})
  include(GoogleTest)
  add_test(NAME ${TEST_NAME} COMMAND ${TEST_NAME})
  set_target_properties(${TEST_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY
                                                ${CMAKE_BINARY_DIR}/tests)
endforeach()
