#! /bin/bash

mkdir builddir
pushd builddir
cmake .. \
  ${CMAKE_ARGS} \
  -GNinja \
  -DBUILD_SHARED_LIBS=ON \
  -DBUILD_EXAMPLES=OFF \
  -DBUILD_TESTS=OFF

ninja
ninja install
