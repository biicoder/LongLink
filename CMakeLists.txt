project(longlink)
cmake_minimum_required(VERSION 3.5)

add_definitions(-std=c++11)

add_executable(longlinkmain main.cpp)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake;${CMAKE_MODULE_PATH}")
include(libevent)
include(libzmq)
add_dependencies(longlinkmain LIBEVENT)
add_dependencies(longlinkmain LIBZMQ)
include(redis_plus_plus)
add_dependencies(longlinkmain REDIS)
add_dependencies(longlinkmain HI_REDIS)
add_dependencies(longlinkmain REDIS-PLUS-PLUS)
target_link_libraries(longlinkmain ${LIBEVENT_LIB})
target_include_directories(longlinkmain PRIVATE ${LIBEVENT_INCLUDE_DIR})
