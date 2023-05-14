#!/bin/bash

n=5
output="out"
echo $3$1


for var in 1 2 3 4 5 6 7 8
do
	echo $var

	if [ $var == 1 ]
	then
			echo hey
			timeout 2m perf stat -o $2$var -x, -I 100 -e branch-instructions,branch-misses,bus-cycles,cache-misses ./VirusShare_2ad68e74f63aa8ee22bbac91619b8177
	fi

	if [ $var == 2 ]
	then
			timeout 2m perf stat -o $2$var -x, -I 100 -e cache-references,cpu-cycles,instructions,ref-cycles ./VirusShare_2ad68e74f63aa8ee22bbac91619b8177
	fi

	if [ $var == 3 ]
	then
			timeout 2m perf stat -o $2$var -x, -I 100 -e L1-dcache-load-misses,L1-dcache-loads,L1-dcache-stores,L1-icache-load-misses ./VirusShare_2ad68e74f63aa8ee22bbac91619b8177
	fi

	if [ $var == 4 ]
	then 
			timeout 2m perf stat -o $2$var -x, -I 100 -e LLC-load-misses,LLC-loads,LLC-store-misses,LLC-stores ./VirusShare_2ad68e74f63aa8ee22bbac91619b8177
	fi 

	if [ $var == 5 ]
	then 
			timeout 2m perf stat -o $2$var -x, -I 100 -e branch-load-misses,branch-loads,dTLB-load-misses,dTLB-loads ./VirusShare_2ad68e74f63aa8ee22bbac91619b8177
	fi 

	if [ $var == 6 ]
	then 
			timeout 2m perf stat -o $2$var -x, -I 100 -e dTLB-store-misses,dTLB-stores,iTLB-load-misses,iTLB-loads ./VirusShare_2ad68e74f63aa8ee22bbac91619b8177
	fi 

	if [ $var == 7 ]
	then 
			timeout 2m perf stat -o $2$var -x, -I 100 -e node-load-misses,node-loads,node-store-misses,node-stores ./VirusShare_2ad68e74f63aa8ee22bbac91619b8177
	fi 

	if [ $var == 8 ]
	then 
			timeout 2m perf stat -o $2$var -x, -I 100 -e mem-loads,mem-stores,ref-cycles ./VirusShare_2ad68e74f63aa8ee22bbac91619b8177
	fi 

done


# for i in {1..5}
# do
# 	echo $i
# 	out=output$i
# 	echo $out
# 	perf stat -o $out -x, -e branches,branch-misses,cache-misses,cache-references,cycles,instructions,stalled-cycles-backend,stalled-cycles-frontend,L1-dcache-load-misses,L1-dcache-loads,L1-dcache-prefetches,L1-icache-load-misses,L1-icache-loads,branch-load-misses,branch-loads,dTLB-load-misses,dTLB-loads,iTLB-load-misses,iTLB-loads -p $1 sleep 2
# done
# perf stat -o xorg.csv -x,  -I 100 -e branches,branch-loads,iTLB-load-misses,dTLB-load-misses -p 5310
