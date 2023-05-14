#!/bin/bash

echo "script perf"
echo $3$1

echo "enter pid"
read pid;

if [ $2 == 1 ]
then
		timeout 1m perf stat -o $1$2 -x, -I 100 -e branch-instructions,branch-misses,bus-cycles,instructions -p $pid
fi

if [ $2 == 2 ]
then
		timeout 1m perf stat -o $1$2 -x, -I 100 -e cache-references,cpu-cycles,ref-cycles,instructions -p $pid
fi

if [ $2 == 3 ]
then
		timeout 1m perf stat -o $1$2 -x, -I 100 -e L1-dcache-load-misses,L1-dcache-loads,L1-dcache-stores,instructions -p $pid
fi

if [ $2 == 4 ]
then 
		timeout 1m perf stat -o $1$2 -x, -I 100 -e LLC-load-misses,LLC-loads,LLC-store-misses,instructions -p $pid
fi 

if [ $2 == 5 ]
then 
		timeout 1m perf stat -o $1$2 -x, -I 100 -e branch-load-misses,branch-loads,dTLB-load-misses,instructions -p $pid
fi 

if [ $2 == 6 ]
then 
		timeout 1m perf stat -o $1$2 -x, -I 100 -e dTLB-store-misses,dTLB-stores,iTLB-load-misses,instructions -p $pid
fi 

if [ $2 == 7 ]
then 
		timeout 1m perf stat -o $1$2 -x, -I 100 -e node-load-misses,node-loads,node-store-misses,instructions -p $pid
fi 

if [ $2 == 8 ]
then 
		timeout 1m perf stat -o $1$2 -x, -I 100 -e mem-loads,mem-stores,ref-cycles,instructions -p $pid
fi 
if [ $2 == 9 ]
then
		timeout 1m perf stat -o $1$2 -x, -I 100 -e cache-misses,L1-icache-load-misses,LLC-stores,instructions -p $pid
fi
if [ $2 == 10 ]
then
		timeout 1m perf stat -o $1$2 -x, -I 100 -e dTLB-loads,iTLB-loads,node-stores,instructions -p $pid
fi

		

# for i in {1..5}
# do
# 	echo $i
# 	out=output$i
# 	echo $out
# 	perf stat -o $out -x, -e branches,branch-misses,cache-misses,cache-references,cycles,instructions,stalled-cycles-backend,stalled-cycles-frontend,L1-dcache-load-misses,L1-dcache-loads,L1-dcache-prefetches,L1-icache-load-misses,L1-icache-loads,branch-load-misses,branch-loads,dTLB-load-misses,dTLB-loads,iTLB-load-misses,iTLB-loads -p $1 sleep 2
# done
# perf stat -o xorg.csv -x,  -I 100 -e branches,branch-loads,iTLB-load-misses,dTLB-load-misses -p 5310
