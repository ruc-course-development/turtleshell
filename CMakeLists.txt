cmake_minimum_required(VERSION 4.2)

project(MySimpleProject CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(MyExecutable main.cpp)

install(TARGETS MyExecutable DESTINATION bin)
