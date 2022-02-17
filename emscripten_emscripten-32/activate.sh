echo "ACTIVATE ALIASES FRESH!!!"

emsdk install  3.1.2
emsdk activate 3.1.2


cmake () {
    emcmake cmake "$@"
}

make () {
    emmake make "$@"
}

configue () {
    emconfigue configue "$@"
}
