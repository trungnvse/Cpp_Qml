# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.31

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = C:\mingw64\bin\cmake.exe

# The command to remove a file.
RM = C:\mingw64\bin\cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = E:\PROGRAMMING\Language_C_plusplus\foudation_C_plusplus\projects\books_management

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = E:\PROGRAMMING\Language_C_plusplus\foudation_C_plusplus\projects\books_management\build

# Include any dependencies generated for this target.
include CMakeFiles/rooster.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/rooster.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/rooster.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/rooster.dir/flags.make

CMakeFiles/rooster.dir/codegen:
.PHONY : CMakeFiles/rooster.dir/codegen

CMakeFiles/rooster.dir/main.cpp.obj: CMakeFiles/rooster.dir/flags.make
CMakeFiles/rooster.dir/main.cpp.obj: CMakeFiles/rooster.dir/includes_CXX.rsp
CMakeFiles/rooster.dir/main.cpp.obj: E:/PROGRAMMING/Language_C_plusplus/foudation_C_plusplus/projects/books_management/main.cpp
CMakeFiles/rooster.dir/main.cpp.obj: CMakeFiles/rooster.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=E:\PROGRAMMING\Language_C_plusplus\foudation_C_plusplus\projects\books_management\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/rooster.dir/main.cpp.obj"
	C:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/rooster.dir/main.cpp.obj -MF CMakeFiles\rooster.dir\main.cpp.obj.d -o CMakeFiles\rooster.dir\main.cpp.obj -c E:\PROGRAMMING\Language_C_plusplus\foudation_C_plusplus\projects\books_management\main.cpp

CMakeFiles/rooster.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/rooster.dir/main.cpp.i"
	C:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E E:\PROGRAMMING\Language_C_plusplus\foudation_C_plusplus\projects\books_management\main.cpp > CMakeFiles\rooster.dir\main.cpp.i

CMakeFiles/rooster.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/rooster.dir/main.cpp.s"
	C:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S E:\PROGRAMMING\Language_C_plusplus\foudation_C_plusplus\projects\books_management\main.cpp -o CMakeFiles\rooster.dir\main.cpp.s

# Object files for target rooster
rooster_OBJECTS = \
"CMakeFiles/rooster.dir/main.cpp.obj"

# External object files for target rooster
rooster_EXTERNAL_OBJECTS =

rooster.exe: CMakeFiles/rooster.dir/main.cpp.obj
rooster.exe: CMakeFiles/rooster.dir/build.make
rooster.exe: _deps/fmt-build/libfmtd.a
rooster.exe: CMakeFiles/rooster.dir/linkLibs.rsp
rooster.exe: CMakeFiles/rooster.dir/objects1.rsp
rooster.exe: CMakeFiles/rooster.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=E:\PROGRAMMING\Language_C_plusplus\foudation_C_plusplus\projects\books_management\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable rooster.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\rooster.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/rooster.dir/build: rooster.exe
.PHONY : CMakeFiles/rooster.dir/build

CMakeFiles/rooster.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\rooster.dir\cmake_clean.cmake
.PHONY : CMakeFiles/rooster.dir/clean

CMakeFiles/rooster.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" E:\PROGRAMMING\Language_C_plusplus\foudation_C_plusplus\projects\books_management E:\PROGRAMMING\Language_C_plusplus\foudation_C_plusplus\projects\books_management E:\PROGRAMMING\Language_C_plusplus\foudation_C_plusplus\projects\books_management\build E:\PROGRAMMING\Language_C_plusplus\foudation_C_plusplus\projects\books_management\build E:\PROGRAMMING\Language_C_plusplus\foudation_C_plusplus\projects\books_management\build\CMakeFiles\rooster.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/rooster.dir/depend

