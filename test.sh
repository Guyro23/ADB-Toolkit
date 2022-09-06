#!/usr/bin/env bash



declare -x rows cols
 
update_size(){
  rows=$(tput lines) # get actual lines of term
  cols=$(tput cols)  # get actual columns of term
  echo DEBUG terminal window has no $rows lines and is $cols characters wide
}

trap update_size WINCH
count=0
while true; do
	echo -ne "Hello World! $count\r";
	sleep 1s;
	((count++))
done
