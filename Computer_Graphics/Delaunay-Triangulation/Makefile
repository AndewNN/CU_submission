CXX=g++
CFXXLAGS=

PROJ_DIR=$(CURDIR)

TARGET=build/main

MAIN_FILE ?= src/main.cpp

INCLUDES=-I$(PROJ_DIR)/include

INPUT ?= input.in
OUTPUT ?= output.out

all: build run

build: $(TARGET)

$(TARGET): $(MAIN_FILE)
	@mkdir -p build
	$(CXX) -o $(TARGET) $(MAIN_FILE) $(INCLUDES) $(CFXXLAGS)

run:
	@./$(TARGET) $(INPUT) $(OUTPUT)

clean:
	$(RM) -rf build/

rebuild: clean all
