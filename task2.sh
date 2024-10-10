#!/bin/bash

cd dataset1

grep -o "sample" file* | uniq | cut -d: -f1 | xargs grep -o "CSC510" | uniq -c| cut -d: -f1 | grep -E "[3-9] file" | xargs -I {} sh -c 'echo {} $(stat -c%s $(echo {} | cut -d" " -f2))' | sort -k1,1nr -k3,3nr | gawk '{print $2}' | sed 's/file_/filtered_/'