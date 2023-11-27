#!/bin/bash

#getting an arthmatic error
#adding feature
MAX=0
CURRENT=0

if [ $# -ne 1 ]; then
  echo "Please provide the input file as an argument."
  exit 1
fi

while read line; do
  if [ -z "$line" ]; then
    if [ $CURRENT -gt $MAX ]; then
      MAX=$CURRENT
    fi

    CURRENT=0
  else
    CURRENT=$(($CURRENT + $line))
  fi
done < "$1"

if [ $CURRENT -gt $MAX ]; then
  MAX=$CURRENT
fi

echo "The elf carrying the most calories has $MAX calories."
