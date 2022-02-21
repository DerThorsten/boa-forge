echo "ACTIVATE ALIASES FRESH!!!"

emsdk install  3.1.2
emsdk activate 3.1.2


export CMAKE_ARGS="$CMAKE_ARGS -DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE=ON"


cmake () {
    emcmake cmake "$@"
}

make () {
    emmake make "$@"
}

# configue () {
#     emconfigue configue "$@"
# }
