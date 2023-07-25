#!/bin/bash
echo "Adding packages in $2 into $1"
for line in `cat "$2"`
do
    cat $1 | grep -x $line >/dev/null
    [ $? -eq 0 ] ||  {
    echo $line >> $1
    echo $line
    }
done
