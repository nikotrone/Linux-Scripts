#!/bin/bash
# Utility to trim leading and trailing spaces and tabs from a given string

# Removing leading spaces
# sed 's/^[ \t]*//'

# Removing trailing spaces
# sed 's/[ \t]*$//'

# Together in one line
sed 's/^[ \t]*//;s/[ \t]*$//' $1
