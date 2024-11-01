#!/bin/bash

echo "Building all files..."
make MAIN_FILE=src/main.cpp INPUT=sample/mcv/triangle.in OUTPUT=sample/mcv/triangle.out
make MAIN_FILE=src/main.cpp INPUT=sample/mcv/multi_tri.in OUTPUT=sample/mcv/multi_tri.out
make MAIN_FILE=src/main.cpp INPUT=sample/mcv/degen.in OUTPUT=sample/mcv/degen.out
make MAIN_FILE=src/main.cpp INPUT=sample/mcv/non_planar.in OUTPUT=sample/mcv/non_planar.out