#Directories for various files
BDIR := bin
ODIR := build
IDIR := include
LDIR := lib
SDIR := src
TDIR := test
GTESTIDIR := lib/googletest-release-1.8.1/googletest/include
GTESTDIR := lib/googletest-release-1.8.1/googletest
GTESTSDIR := lib/googletest-release-1.8.1/googletest/src

# include libraries such as math library below
# LIBS = -lm

#files
SRC_FILES := $(wildcard $(SDIR)/*.cpp)
OBJ_FILES := $(patsubst $(SDIR)/%.cpp,$(ODIR)/%.o,$(SRC_FILES))
INC_FILES := $(wildcard $(IDIR)/*.h)
#the test files themselves
TEST_FILES := $(wildcard $(TDIR)/*.cpp)
#the src files that need to be tested
TEST_SRC_FILES := $(filter-out $(SDIR)/main.cpp, $(wildcard $(SDIR)/*.cpp))

#flags for compiling etc
CXX := g++
CXXFLAGS := -I$(IDIR)

# we define a rule that applies to all files ending in the .o suffix.
# The rule says that the .o file depends upon the .cpp version of the file and the .h files included in the DEPS macro.
# The rule then says that to generate the .o file, make needs to compile the .c file using the compiler defined in the CC macro.
# The -c flag says to generate the object file, the -o $@ says to put the output of the compilation in the file named on the left
# side of the :, the $< is the first item in the dependencies list, and the CFLAGS macro is defined as above.
$(ODIR)/%.o: $(SDIR)/%.cpp $(INC_FILES)
	$(CXX) -c -o $@ $< $(CXXFLAGS)

hellomake: $(OBJ_FILES)
	$(CXX) -o $(BDIR)/$@ $^ $(CXXFLAGS) $(LIBS)

#this will create the libgtest.a library to use for linking your test to. It is located under lib directory.
.PHONY: testlibrary

testlibrary:
	$(CXX) -I$(GTESTIDIR) -I$(GTESTDIR) -c $(GTESTSDIR)/gtest_main.cc -o $(ODIR)/gtest_main.o
	$(CXX) -I$(GTESTIDIR) -I$(GTESTDIR) -c $(GTESTSDIR)/gtest-all.cc -o $(ODIR)/gtest-all.o
	ar -rv $(LDIR)/libgtest.a $(ODIR)/gtest_main.o $(ODIR)/gtest-all.o

.PHONY: test

#this will compile all of the test files with all src files to be tested
test:
	g++ -I$(GTESTIDIR) -I$(IDIR) -pthread $(TEST_FILES) $(TEST_SRC_FILES) $(INC_FILES) $(LDIR)/libgtest.a -o $(BDIR)/my_cool_test

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o $(BDIR)/*.exe *~ core $(IDIR)/*~
