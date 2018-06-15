#!/bin/bash

# get target to look for in the list of branches
target_pattern=$1

echo "looking for branch name containing '$target_pattern' ..."

search_result=$(git branch --list | grep "$target_pattern")
result_amount=$(echo "$search_result" | wc -l)

# check if multiple results has been found
if [ "$result_amount" -gt 1 ] 
then 
    echo "There are multiple branches matching the same pattern: "
    echo "$search_result"
    exit 1
fi    

search_result=${search_result//\*/""}
search_result=$(echo "$search_result" | sed 's/^[ \t]*//;s/[ \t]*$//')
echo "result: '$search_result'"

# jump to the selected branch
git checkout "$search_result"    
