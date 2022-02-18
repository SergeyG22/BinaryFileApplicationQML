### BinaryFileApplicationQML

A program for comparing binary files. Main features:

* lightweight GUI
* cross-platform
* ease of use <br><br>

### Installing dependencies

Python interpreter and the Conan package manager must be installed.

To install Conan, enter the following command:

```
pip3 install conan 
```

To check that the Conan is installed correctly enter in cmd:

```
conan --version
```

Download the sources and install the required dependencies:

```
git clone https://github.com/SergeyG22/BinaryFileApplicationQML.git
cd BinaryFileApplicationQML
cd cmake 
conan install ../scripts -g qmake
```

Add the following lines to the .pro file:

```
CONFIG += conan_basic_setup
include(cmake/conanbuildinfo.pri)
```

To switch between Debug and Release builds:

```
cd cmake
conan install ../scripts -s build_type=Debug
```
```
cd cmake
conan install ../scripts -s build_type=Release
```

### Building from source

**MinGW compiler debug version:**

```
Select the compiler command line MinGW and go to the directory with the .pro file (example MinGW 7.3.0 64-bit command line)
Then enter the following commands:

mkdir build
cd build
qmake -makefile ..
mingw32-make debug

After entering the commands, an executable file will appear in the build folder.
```
**MinGW compiler release version:**

```
mkdir build
cd build
qmake -makefile ..
mingw32-make release
```
After entering the commands, an executable file will appear in the build folder.To add a DLL in the directory with Qt (not QtCreator, namely Qt of the desired version), there is a utility in the bin folder windeployqt.exe . Run it and it will copy the necessary files:
windeployqt.exe "the path to the application file." Choose it for your compiler (MinGW or MSVC).

---

**MSVC compiler debug version:**

```
Run vcvarsall.bat in directory vs19\VC\Auxiliary\Build
Select the compiler command line MSVC and go to the directory with the .pro file (example x64 Native Tools Command Promt)

Then enter the following commands:

mkdir build
cd build
qmake -makefile ..
nmake Debug

After entering the commands, an executable file will appear in the build folder.
```

**MSVC compiler release version:**

```
mkdir build
cd build
qmake -makefile ..
nmake Release
```


### Control panel

[Browse] - choose the path to folder one<br>
[Browse] - choose the path to folder two<br>
[Search] - find duplicate binary files<br>
[Clear] - clear the output window <br>

### Examples 

Run the program and select the example folder in the root of the source directory. Specify the path to binary_a and binary_b folders. Click [Search]. A list of duplicates will be displayed.

### Preview
