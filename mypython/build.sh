#!/usr/bin/env bash



if [[ $target_platform == "emscripten-32" ]]; then
    echo "EMSCRIPTEN!"
    mkdir -p builddir/emscripten-browser
    pushd builddir/emscripten-browser


    embuilder build zlib


    # mkdir -p usr/local


    CONFIG_SITE=../../Tools/wasm/config.site-wasm32-emscripten \
    emconfigure ../../configure -C \
        --host=wasm32-unknown-emscripten \
        --build=$(../../config.guess) \
        --with-emscripten-target=browser \
        --with-build-python=python3.11 \
        --prefix=$PREFIX 
        
        # --exec_prefix=$(pwd)/usr/local \
    #     --prefix=$(pwd)/usr/local


    make -j$(nproc) || true
    make install
    node python.js
    echo "LS"
    ls
    mkdir -p $PREFIX/bin/
    cp -t $PREFIX/bin/ python.* 
    popd

else
    mkdir -p build
    pushd build
    ../configure -C \
        --prefix=$PREFIX

    make -j$(nproc)
    make install
    popd

fi
