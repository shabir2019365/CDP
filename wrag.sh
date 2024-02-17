#!/bin/bash

# Step 1: Download the CSV file and extract numerical columns, removing the first line
curl https://archive.ics.uci.edu/ml/machine-learning-databases/forest-fires/forestfires.csv | tail -n +2 | awk -F',' '{print $1, $2}' > extracted_data.csv

# Step 2: Find Min and Max of the first column
min_max_first_column=$(awk 'BEGIN {min=1000000; max=-1000000} {if ($1 < min) min=$1; if ($1 > max) max=$1} END {print "Min:", min, "Max:", max}' extracted_data.csv)
echo "Min and Max of the first column: $min_max_first_column"

# Step 3: Find the Difference of the Sum of Each Column
difference_sum_columns=$(awk '{sum1+=$1; sum2+=$2} END {print "Difference:", sum1 - sum2}' extracted_data.csv)
echo "Difference of the sum of each column: $difference_sum_columns"
