#!/bin/bash
pip install --upgrade pip
pip install torch==2.0.1+cu118 torchvision==0.15.2+cu118 --extra-index-url https://download.pytorch.org/whl/cu118
# Install TinyCuda
pip install git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch
# Install nerfstudio
pip install git+https://github.com/nerfstudio-project/nerfstudio.git
# Install COLMAP
sudo apt-get install \
    git \
    cmake \
    ninja-build \
    build-essential \
    libboost-program-options-dev \
    libboost-filesystem-dev \
    libboost-graph-dev \
    libboost-system-dev \
    libeigen3-dev \
    libflann-dev \
    libfreeimage-dev \
    libmetis-dev \
    libgoogle-glog-dev \
    libgtest-dev \
    libsqlite3-dev \
    libglew-dev \
    qtbase5-dev \
    libqt5opengl5-dev \
    libcgal-dev \
    libceres-dev

git clone https://github.com/colmap/colmap.git
cd colmap
git checkout dev
mkdir build
cd build
cmake cmake -DCMAKE_CUDA_ARCHITECTURES=all-major .. -GNinja
ninja
sudo ninja install

# colmap -h
# ns-process-data images --data /36 --output-dir output_36