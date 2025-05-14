#!/bin/bash
num="1 2 3 4 5 6 7 8"  # Define a space-separated list of numbers
for n in $num           # Loop through each number in the list
do
  q=`expr $n % 2`       # Calculate the remainder when n is divided by 2
  if [ $q -eq 0 ]       # If the remainder is 0, the number is even
  then
    echo "even no"      # Print "even no" if the number is even
    continue            # Skip the rest of the loop and move to the next number
  fi
  echo "odd no"         # Print "odd no" for odd numbers
done
