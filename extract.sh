#!/bin/bash
start_pat="^([^,]*,){4}$2(,[^,]*){12}"
end="^(,|)$"
sed -r -n "/$start_pat/,/$end/p" $1 | sed "/^,$/d"
