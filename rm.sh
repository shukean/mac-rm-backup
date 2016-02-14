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
        cp -r $_tmp $backPath
        if [ "$?" -eq '0' ]; then
            printf '%b\n' "\33[32m[✔]\33[0m copy $arg" >&2
        else
            printf '%b\n' "\33[31m[✘]\33[0m copy fail $arg"
        fi
    fi
done

rm -i $*



