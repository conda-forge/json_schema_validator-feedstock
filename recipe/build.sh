#! /bin/bash

cmake ${CMAKE_ARGS} . \
-DCMAKE_INSTALL_PREFIX=$PREFIX \
-DBUILD_SHARED_LIBS=ON \
-DBUILD_EXAMPLES=OFF \
-DBUILD_TESTS=OFF \
-Bbuilddir

make -C builddir/ install
