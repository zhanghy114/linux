#!/bin/bash
dir=`ls zhanghy/`
for i in $dir
do
    file=zhanghy/$i
    if [ -f $file ];then
         grep 'girl' $file > /dev/null 2>&1
         if [ $? -eq 0 ];then
             cp $file $file.bak
            sed -i s/girl/boy/g $file
         fi
    fi
done 


