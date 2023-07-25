#!/bin/bash
for dir in `ls SpiralLinux* -d`
do
    rm -f ${dir#*'-'}.tar.zst
    tar -cf ${dir#*'-'}.tar.zst $dir
done
