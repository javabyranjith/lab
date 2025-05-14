#!/bin/bash
echo "enter the a value"      # Prompt user to input the value of a
read a                        # Read the value of a

echo "enter b value"          # Prompt user to input the value of b
read b                        # Read the value of b

c=`expr $a + $b`              # Calculate the sum of a and b
echo "sum:"$c                 # Display the sum

c=`expr $a - $b`              # Calculate the difference between a and b
echo "sub:"$c                 # Display the subtraction result

c=`expr $a \* $b`             # Calculate the multiplication of a and b (note the escape for *)
echo "mul:"$c                 # Display the multiplication result

c=`expr $a / $b`             # Calculate the division of a by b
echo "div:"$c                 # Display the division result
