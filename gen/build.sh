#!/bin/sh
if [[ $# -ne 2 ]]; then
	echo "2 Parameter is needed. Use $0 T N_MAX L_MAX to run this program"
	exit 1
fi
t=$1
g++ -O2 -std=c++11 -o a.out int.cpp
g++ -O2 -std=c++11 -o b.out gen.cpp
g++ -O2 -std=c++11 -o c.out ../code/sol.cpp
shift
for((i=1;i<=2;i++));do
	echo $i
    g++ -O2 -std=c++11 -o d.out sample$i.cpp
    ./d.out > ../samples/sample$i.in
	echo "Input prepared"
	./c.out < ../samples/sample$i.in > ../samples/sample$i.out
    echo "Output prepared"
done
for((i=1;i<=t;i++));do
	echo $i
    seed=$((100000*$i+$1))
	echo $seed | ./a.out > ../testcases/$i.in
	echo "Input prepared"
	./c.out < ../testcases/$i.in > ../testcases/$i.out
    echo "Output prepared"
done
for((i=t+1;i<=t+t;i++));do
	echo $i
    seed=$((100000*$i+$1))
	echo $seed | ./b.out > ../testcases/$i.in
	echo "Input prepared"
	./c.out < ../testcases/$i.in > ../testcases/$i.out
    echo "Output prepared"
done
