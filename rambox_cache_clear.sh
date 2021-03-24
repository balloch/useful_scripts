#!/bin/bash

set -eu

cd $HOME/.config/Rambox/Partitions
for dir in *;do
    cd $dir
    printf '%s\n' "clearing cache for $dir\n"
    rm -rf Cache/*
    rm -rf Code\ Cache/js/*
    rm -rf Service\ Worker/CacheStorage/*
    rm -rf Service\ Worker/ScriptCache/*
    if [[ -d IndexedDB ]]; then
        find IndexedDB/ | grep /[0-9]*.ldb | sort | head -n-1 | xargs rm -f
    fi
    printf '%s\n' "Cache cleared for $dir\n"
    cd ..
done
