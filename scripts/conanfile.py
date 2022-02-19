from conans import ConanFile, CMake

class Libraries(ConanFile):
	name = "Libraries"
	settings = "os","compiler","build_type","arch"
	generators = "cmake","cmake_find_package"
	requires = [("boost/1.78.0")]
