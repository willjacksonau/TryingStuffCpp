#Directories for various files
BDIR := bin
ODIR := build
IDIR := include
LDIR := lib
SDIR := src
TDIR := test

# include libraries such as math library below
# LIBS = -lm

#files
SRC_FILES := $(wildcard $(SDIR)/*.cpp)
OBJ_FILES := $(patsubst $(SDIR)/%.cpp,$(ODIR)/%.o,$(SRC_FILES))
INC_FILES := $(wildcard $(IDIR)/*.h)

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

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o $(BDIR)/*.exe *~ core $(IDIR)/*~
