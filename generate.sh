#!/bin/bash

path=build

mkdir -p $path

cat redirects.yml | while read line
do
  contents=(${line//: / })
  url=${contents[1]}
  if [ "$url" ]; then
    file_path=$path/${contents[0]}.html

    cp template.html "$file_path"
    sed -i -e 's#REPLACE_ME#'"$url"'#g' $file_path
    rm $file_path-e
  fi;
done