#!/bin/bash

path=build
template='<html><head><meta http-equiv="refresh" content="0;url=REPLACE_ME" /></head></html>'

rm -f ./build/*
mkdir -p $path

cat redirects.yml | while read line
do
  contents=(${line//: / })
  url=${contents[1]}
  file_path=$path/${contents[0]}.html

  if [ "$url" ]; then
    echo ${template/REPLACE_ME/$url} > $file_path
  fi;
done