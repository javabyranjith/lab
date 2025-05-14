#!/bin/bash
echo "Which table do you want?"  # Prompt the user for the table number
read n                           # Read the number for the table

# Loop through 1 to 10 and display the multiplication results
for ((i=1; i<=10; i++))
do
  echo "$i * $n = $(expr $i \* $n)"  # Print the multiplication result
done
