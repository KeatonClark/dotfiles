cmake_minimum_required(VERSION 4.0)
project(verilog-template)
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)

enable_testing()
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/sim)
