#!/bin/bash
set -e
set -o pipefail
# set -x

path=build
template='<html><head><meta http-equiv="refresh" content="0;url=REPLACE_ME" /></head></html>'

cat redirects.yml | while read line
do
  contents=(${line//: / })
  url=${contents[1]}
  mkdir -p $path/${contents[0]}

  if [ "$url" ]; then
    echo ${template/REPLACE_ME/$url} > $path/${contents[0]}/index.html
  fi;
done
