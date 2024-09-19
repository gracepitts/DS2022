#!/bin/bash

set -e

#Move into the people dir
cd ../people

#Look for readme
target_file="README.md"

#Loop through the dirs and find the target file
for dir in $( find . -type d); do
  if [ -f "$dir/$target_file" ]; then
  #  echo "$dir/$target_file";
    name=`head -n 1 "$dir/$target_file"`
    echo $name;
  fi
done
