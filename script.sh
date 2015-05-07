#!/usr/bin/bash

#mkdir /mylibs
/usr/sbin/nginx &
cp --parents $( lsof -c nginx |grep .so|awk '/\.so/{print $9}' ) /mylibs
cp --parents $( ldd /usr/sbin/nginx | grep so | sed -e '/^[^\t]/ d' | sed -e 's/\t//' | sed -e 's/.*=..//' | sed -e 's/ (0.*)//' | uniq | sort ) /mylibs
cp --parents $( dpkg -L $( dpkg -l| awk  '/nginx/{print $2}' )) /mylibs
