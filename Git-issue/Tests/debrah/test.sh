#!/bin/sh

readContent=`cat test.c`

re='die'
while [[ $readContent =~ $re ]]; do
  readContent=${BASH_REMATCH[1]}${BASH_REMATCH[2]}
done

echo $readContent