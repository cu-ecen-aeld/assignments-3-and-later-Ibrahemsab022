# Variables Section:
CROSS_COMPILE ?=		#Cross-compile prefix defaulted to native compiler.
CC :=$(CROSS_COMPILE)gcc	#Compiler command
CFLAGS :=-Wall -Werror		#Compiler flags
TARGET :=writer		#Target App name
SRC :=./writer.c		#Source file path
OBJ :=$(SRC:.c=.o)		#Obj file out

# Default target: building the app
.PHONY: all
all: $(TARGET)

# Building the writer app
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

# Compiling source file into Obj
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Cleaning target
.PHONY: clean
clean:
	rm -f $(TARGET) $(OBJ)


.PHONY: debug
debug:
	@echo "OBJ:=$(OBJ)"
	@echo "SRC:=$(SRC)"

