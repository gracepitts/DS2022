#!/bin/bash

curl -O https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz
tar -xzvf lab3-bundle.tar.gz
awk '!/^[[:space:]]*$/' lab3_data.tsv
cat lab3_data.tsv | tr '\t' ',' > my_clean_file.csv
data_count=$(tail -n +2 my_clean_file.csv | wc -l)
echo "Number of data rows: $data_count"
tar -czvf converted-archive.tar.gz my_clean_file.csv
