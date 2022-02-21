#!/usr/bin/env bash



if [[ $target_platform == "emscripten-32" ]]; then
    echo "EMSCRIPTEN!"
    mkdir -p builddir/emscripten-browser
    pushd builddir/emscripten-browser
    export CONFIG_SITE=../../Tools/wasm/config.site-wasm32-emscripten 


    embuilder build zlib bzip2


    # mkdir -p usr/local


    emconfigure ../../configure -C \
        --host=wasm32-unknown-emscripten \
        --build=$(../../config.guess) \
        --with-emscripten-target=browser \
        --with-build-python=python3.11 \
        --prefix=$PREFIX 
        
        # --exec_prefix=$(pwd)/usr/local \
    #     --prefix=$(pwd)/usr/local


    make -j$(nproc) || true
    emmake make install
    echo "LS"
    ls
    # cp -a $(pwd)/python $PREFIX/bin/
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
