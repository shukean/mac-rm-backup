#! /bin/sh

tmp=`date +"%Y%m%d.%H"`
backPath=$HOME/.rm.back/$tmp
curPath=`pwd`

if [ ! -d $backPath ]; then
    mkdir -p $backPath
fi

args=($*)
for arg in $*; do
    _tmp=$curPath/$arg
    if [ -b $_tmp -o -c $_tmp -o -d $_tmp -o -f $_tmp ]; then
        printf '%b\n' "\33[32m[✔]\33[0m copy $arg" >&2
        cp -r $_tmp $backPath
    fi
done

rm -i $*



