#!/bin/bash

open_group="^\[\{"
close_group="^\},"
tagged_key="\"(.*)\""
tagged_value="\"?([^\",]*)\"?,?"

col=$(sed -r -n "/$open_group/,/$close_group/p" $1 | sed -r -n "/$open_group|$close_group/!p" \
|sed -r "s/$tagged_key *: *$tagged_value/\1/")

echo "$col"| xargs  -I{} sed -r  -n "/\"{}\" *:$tagged_value/s//\1/w /tmp/{}.tmp" $1

echo $col | tr " " ","
paste -d "," $(echo "$col"| xargs  -I{} echo /tmp/{}.tmp  )
