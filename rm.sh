#! /bin/sh

tmp=`date +"%Y%m%d.%H"`
backPath=$HOME/.Trash/$tmp
curPath=`pwd`

if [ ! -d $backPath ]; then
    mkdir -p $backPath
fi

for arg in $*; do
    _tmp=$curPath/$arg
    if [ -e $_tmp ]; then
        mv -f $_tmp $backPath
        if [ "$?" -eq '0' ]; then
            printf '%b\n' "\33[32m[✔]\33[0m backup $arg" >&2
        else
            printf '%b\n' "\33[31m[✘]\33[0m backup fail $arg"
        fi
    fi
done
