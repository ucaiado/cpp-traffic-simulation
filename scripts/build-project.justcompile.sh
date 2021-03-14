#!/bin/bash
BuildDir="build"

cd /CppND-Program-a-Concurrent-Traffic-Simulation/
clang-format src/* -i
if [ ! -d "$BuildDir" ]; then
mkdir $BuildDir
else
rm -rf build
mkdir $BuildDir
fi
cd $BuildDir

# build project
cmake ..
make

