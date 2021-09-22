# Define the compiler and the linker. The linker must be defined since
# the implicit rule for linking uses CC as the linker. g++ can be
# changed to clang++.
CXX = g++
CC  = $(CXX)

# Generate dependencies in *.d files
DEPFLAGS = -MT $@ -MMD -MP -MF $*.d

# Define preprocessor, compiler, and linker flags. Uncomment the # lines
# if you use clang++ and wish to use libc++ instead of GNU's libstdc++.
# -g is for debugging.
CPPFLAGS =  -std=c++11 -I.
CXXFLAGS =  -O0 -Wall -Wextra -pedantic-errors -Wold-style-cast 
CXXFLAGS += -std=c++11 
CXXFLAGS += -g3
CXXFLAGS += $(DEPFLAGS)
LDFLAGS =   -g3 
#CPPFLAGS += -stdlib=libc++
#CXXFLAGS += -stdlib=libc++
#LDFLAGS +=  -stdlib=libc++

# Phony targets
.PHONY: clean distclean test

# Standard clean
clean:
	rm -f src/*.o
	rm -f tests/*.o

dclean: clean
	rm -f src/*.d
	rm -f tests/*.d

test: dclean
	$(MAKE) -C tests
	./tests/test_orderbook

debug: dclean
	$(MAKE) -C tests
	lldb ./tests/test_orderbook

benchmark: dclean
	$(MAKE) -C tests
	./tests/test_benchmark



# Include the *.d files
SRC = $(wildcard *.cc)
-include $(SRC:.cc=.d)
