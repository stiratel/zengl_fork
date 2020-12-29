#!/bin/sh
p=`(echo ${BASH_SOURCE[0]}) 2>&1`
p=${p%%:*}
d=${p%/*}
cd $d

rm *.a
rm *.o
rm *.ppu


fpc -CX -XX gitopihalo.pp

read -p "Нажмите Enter для продолжения..."
strip gitopihalo
upx gitopihalo
rm *.a
rm *.o
rm *.ppu

