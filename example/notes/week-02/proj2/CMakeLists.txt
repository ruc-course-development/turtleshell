cmake_minimum_required(VERSION 4.2)

project(proj2)

find_package(nlohmann_json REQUIRED)
find_package(pybind11 CONFIG REQUIRED)

add_executable(proj2 main.cpp)

target_link_libraries(proj2 PRIVATE nlohmann_json::nlohmann_json)

install(TARGETS proj2
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)
