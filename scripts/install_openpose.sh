#/bin/bash

git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose.git
cd openpose && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j`nproc` 

