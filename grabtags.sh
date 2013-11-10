#! /bin/bash
find ./ -name *.html -print0| xargs -0 grep -oP "<([a-z][^\s>]+)" | awk '{split($1,array,"<"); print array[2]}' | sort | uniq