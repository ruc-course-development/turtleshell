from conan import ConanFile
from conan.tools.cmake import CMake, cmake_layout, CMakeToolchain

class ruc_sci_comp(ConanFile):
    name = "mine"
    version = "1.0.0"
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps", "CMakeToolchain" # Or other generators as needed


    def layout(self):
        cmake_layout(self)   # enables CMake presets

    def requirements(self):
        self.requires("fmt/12.1.0")
        self.requires("nlohmann_json/3.12.0")
        self.requires("pybind11/3.0.1")

    def configure(self):
        self.options["fmt/12.1.0"].header_only = True

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

    def package(self):
        cmake = CMake(self)
        cmake.install()
