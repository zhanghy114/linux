#!/bin/bash
#random create 10 user with a passwd of 10digits 
number=10
for i in `seq 1 $number`
do
    id admin$i >/dev/null 2>&1
    if [ $? -eq 0 ];then
        user_dir=/home/admin$i
        sudo userdel admin$i
        sudo rm -rf $user_dir
    fi
    sudo useradd -M admin$i
    passwd=`echo $RANDOM | md5sum | cut -c 1-10 | tr "[a-z]" "[0-9]"`
    echo $passwd | passwd --stdin admin$i >/dev/null 2>&1
    echo "admin$i $passwd" >> passwd.txt
done
