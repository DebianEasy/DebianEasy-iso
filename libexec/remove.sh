#!/bin/bash
echo "Removing packages in $2 from $1"
for line in `cat "$1"`
do
    cat $2 | grep -x $line
    [ $? -eq 0 ] &&  sed -i  "/$line/d" $1
done
