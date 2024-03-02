#!/bin/zsh


cd /Users/rubayetalam/Downloads/spikeprot1105
file=$(pwd)
echo "we are in right place: $file"

countries=("Iran" "Niger")
for i in "${countries[@]}"
do
 echo "loop is working for $i"
 grep -A 1 -E ">.*\|hCoV-19/$i/" /Users/rubayetalam/Downloads/spikeprot1105/spikeprot1105.fasta > /Users/rubayetalam/Downloads/spikeprot1105/${i}_spike_new_check.fasta
 echo "the results are here for $i"
 echo $i
done
