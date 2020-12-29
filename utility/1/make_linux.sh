#!/bin/sh
p=`(echo ${BASH_SOURCE[0]}) 2>&1`
p=${p%%:*}
d=${p%/*}
cd $d

konsole -e  "$d/./compil.sh" 
                            
