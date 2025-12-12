#include <pybind11/pybind11.h>

namespace py = pybind11;

int add(int a, int b) { return a + b; }

PYBIND11_MODULE(proj3, m) {
    m.doc() = "Example pybind module";
    m.def("add", &add);
}