cmake_minimum_required(VERSION 4.2)

project(proj1)

find_package(nlohmann_json REQUIRED)
find_package(pybind11 CONFIG REQUIRED)

add_executable(proj1 main.cpp)

target_link_libraries(proj1 PRIVATE nlohmann_json::nlohmann_json)

install(TARGETS proj1
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)
