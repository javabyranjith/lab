#!/bin/sh
echo "Enter a number:"
read num

# Check if the input is a valid number (optional step for better input validation)
if ! [[ "$num" =~ ^-?[0-9]+$ ]]; then
    echo "Invalid input. Please enter a valid integer."
    exit 1
fi

# Conditional check to determine if the number is positive, negative, or zero
if [ $num -gt 0 ]; then
    echo "The number is positive."
elif [ $num -lt 0 ]; then
    echo "The number is negative."
else
    echo "The number is zero."
fi
