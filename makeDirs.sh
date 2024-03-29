#!/bin/bash

# Root README title and subtitle
echo "# CIS 600 Fundamental Data and Knowledge Mining" > README.md
echo "## Table of Contents" >> README.md

# Titles for each week
titles=(
  "Week 1 Data Mining Overview"
  "Week 2 Data Types and Preparation"
  "Week 3 Data Exploration"
  "Week 4 Decision Tree Induction"
  "Week 5 Performance Evaluation"
  "Week 6 Bayes' Theorem"
  "Week 7 Other Classification Methods"
  "Week 8 Association Rule"
  "Week 9 Cluster Analysis: K-Means and Hierarchical"
  "Week 10 Alternative Cluster Analysis and Performance Evaluation"
)

# Loop from 1 to 10 for folders and READMEs
for week in {1..10}; do
  # Create the folder name
  folder="week$week"
  
  # Make the directory
  mkdir -p "$folder"
  
  # Create the README.md file with the title and table of contents
  echo "# ${titles[$week-1]}" > "$folder/README.md"
  
  echo "## Table of Contents" >> "$folder/README.md"

  for i in {1..10}; do
    if [ $i -eq $week ]; then
      echo "- **&rarr;[${titles[$i-1]}](README.md)**" >> "$folder/README.md"**
      continue
    fi
    echo "- [${titles[$i-1]}](../week$i/README.md)" >> "$folder/README.md"
  done

  # Add hyperlink to the root README.md
  echo "- [${titles[$week-1]}](./$folder/README.md)" >> README.md
done