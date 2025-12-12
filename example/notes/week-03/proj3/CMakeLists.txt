cmake_minimum_required(VERSION 4.2)

project(proj3)

find_package(nlohmann_json REQUIRED)
find_package(pybind11 CONFIG REQUIRED)

option(DO_PYTHON_INSTALL "Install module into python-specific path" OFF)

pybind11_add_module(proj3 mymodule.cpp)

target_link_libraries(proj3 PRIVATE nlohmann_json::nlohmann_json)

if(DO_PYTHON_INSTALL)
    install(TARGETS proj3
        RUNTIME DESTINATION .
        LIBRARY DESTINATION .
        ARCHIVE DESTINATION .
    )
else()
    install(TARGETS proj3
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
    )
endif()
