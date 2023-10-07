#!/bin/sh

num1=$1
num2=$2

is_number(){
	case $1 in 
		''|*[!0-9-]*) return 1;;
		*) return 0;;
	esac
}

if [ -z "$num1" ] || [ -z "$num2" ]; then
	echo "Invalid input."
	exit 1
elif ! is_number "$num1" || ! is_number "$num2"; then
	echo "Invalid input."
	exit 1
elif [ "$num1" -le 0 ] || [ "$num2" -le 0 ]; then
	echo "Input must be greater than 0."
	exit 1
fi

i=1
while [ $i -le $num1 ]; do
	j=1
	while [ $j -le $num2 ]; do
		printf "%d*%d=%d\t" $i $j $((i*j))
		j=$((j+1))
	done
	echo
	i=$((i+1))
done
