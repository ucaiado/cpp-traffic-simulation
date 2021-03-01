#!/bin/bash
BuildDir="build"

cd /CppND-Program-a-Concurrent-Traffic-Simulation/
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

# run the program created
./traffic_simulation

