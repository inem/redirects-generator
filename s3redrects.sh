#!/bin/bash
set -e
set -o pipefail
# set -x

# aws command expects you to provide AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY envronmen variables

touch zero

cat redirects.yml | while read line
do
  contents=(${line//: / })
  url=${contents[1]}
  key=${contents[0]}

  if [ "$url" ]; then
    aws s3 cp zero s3://inem.at/$key --website-redirect $url
  fi;
done

rm zero
