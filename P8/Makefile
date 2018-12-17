CXX=g++
RM=rm -f
CXXFLAGS=-x c++ -Wc++11-extensions
MACFLAGS=-ll -lm
F=flex
B=bison -d

SRCSFLEX=ejercicio5.l
SRCBISON=ejercicio5.y
SRCS=ejercicio5.tab.c lex.yy.c
OBJS=ejercicio5.o

all: flex bison clang

clang:
	$(CXX) $(CXXFLAGS) $(SRCS) -o $(OBJS) $(MACFLAGS)

flex:
	$(F) $(SRCSFLEX)

bison:
	$(B) $(SRCBISON)

clean:
	$(RM) $(OBJS) $(SRCS) ejercicio5.tab.h
	echo "Cleaned"
