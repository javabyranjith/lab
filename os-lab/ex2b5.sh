#!/bin/bash

# Define the add function
add()
{
  c=`expr $1 + $2`  # Perform addition
  echo "addition = $c"  # Output the result
}

# Call the add function with arguments 5 and 10
add 5 10
