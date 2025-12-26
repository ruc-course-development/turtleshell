from conan import ConanFile
from conan.tools.cmake import CMake, CMakeToolchain, CMakeDeps, cmake_layout

class App(ConanFile):
    settings = "os", "arch", "compiler", "build_type"

    def generate(self):
        tc = CMakeToolchain(self)
        tc.generate()
        deps = CMakeDeps(self)
        deps.generate()

    def requirements(self):
        self.requires("benchmark/1.9.4")
        self.requires("gperftools/2.17.2")
        self.requires("fmt/12.1.0")
        self.requires("nlohmann_json/3.12.0")
        self.requires("pybind11/3.0.1")
