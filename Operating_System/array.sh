#!/bin/sh

# Define an array
set -- "apple" "banana" "cherry"

# Access array elements
echo "First element: $1"
echo "Second element: $2"
echo "Third element: $3"

# Get the number of elements in the array
echo "Number of elements in the array: $#"

# Loop through the array
echo "All elements in the array:"
for fruit in "$@"; do
  echo "$fruit"
done
