all:
	conan install conan-deps --output-folder conan-deps/build --build=missing --conf tools.system.package_manager:mode=install
	conan install conan-deps --output-folder conan-deps/build --build=missing --conf tools.system.package_manager:mode=install --profile debug

clean:
	build