#! /bin/bash

cmake . \
-DCMAKE_INSTALL_PREFIX=$PREFIX \
-DBUILD_SHARED_LIBS=ON \
-DBUILD_EXAMPLES=OFF \
-DBUILD_TESTS=OFF \
-Bbuilddir

make -C builddir/ install
