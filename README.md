# TryingStuffCpp
The goal of this project is to go from a 2 file project that is compiled manually to a project that can be scaled out and uses CMAKE as the build tool. With a project structure that promotes scalability and clean code such as the example found here https://hiltmon.com/blog/2013/07/03/a-simple-c-plus-plus-project-structure/ or here https://stackoverflow.com/questions/13521618/c-project-organisation-with-gtest-cmake-and-doxygen
The src and header files will be seperate. Third party files such as gtest are seperate. There is a build directory and a bin directory that has all build files and binary files that are created.

Steps:
 1. Create 2 files and build manually                                   DONE
 2. Create makefile for those 2 files                                   DONE
 3. Create a testfile and run google test                               DONE
 4. Add a make command to run tests                                     DONE
 5. Seperate files into different folders src, test, include            DONE
 6. Put build and bin files in their own directory automatically        DONE
 7. Figure out how to do all of this with cmake
