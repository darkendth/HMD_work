#!/bin/bash

echo $1

echo "run"

un="_z"

for n in {1..10};
do
	./viruses/$1 
	echo "$n "
	./script3.sh $1$un $n
	# sleep 1m
	echo "hey"
	pkill -1 $1
	sleep 2
done