PREFIX = ../../../conan-deps/build
INSTALL_PREFIX = $(CURDIR)
BUILD_TYPE ?= Release

.PHONY: all configure build install clean

all: build install

build/CMakeCache.txt:
	cmake -B build -S . \
		-DCMAKE_TOOLCHAIN_FILE=$(PREFIX)/conan_toolchain.cmake \
		-DCMAKE_INSTALL_PREFIX=$(INSTALL_PREFIX) \
		-DCMAKE_BUILD_TYPE=$(BUILD_TYPE)

configure: build/CMakeCache.txt

build: build/CMakeCache.txt
	cmake --build build

install:
	cmake --install build

clean:
	rm -rf build bin lib
