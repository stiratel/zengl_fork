#!/bin/sh
p=`(echo ${BASH_SOURCE[0]}) 2>&1`
p=${p%%:*}
d=${p%/*}
cd $d
konsole -e  "$d/utility/1/./gitopihalo" "$d" --1 utility/1/

                   