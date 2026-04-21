# Day 1 · Exercise
# Topic: Git, GitHub and Data in R
# Author: Your Name
# GitHub: @yourhandle
# Date: YYYY-MM-DD

# Fill in the code under each section. Run section by section with
# Ctrl+Enter (line) or Ctrl+Shift+Enter (whole chunk). Save the file,
# commit, and push to your fork.


# ---- 1. Identify yourself ----------------------------------------------
# Replace the placeholders at the top of this file with your real name,
# your GitHub handle and today's date.


# ---- 2. R as a calculator ----------------------------------------------
# Compute:
#   a) the sum of the first 100 positive integers,
#   b) the geometric mean of c(2, 4, 8, 16).

# your code here


# ---- 3. Vectors --------------------------------------------------------
# Build a numeric vector with the monthly average temperatures in
# Las Palmas (°C) from a source of your choice. Compute its minimum,
# maximum, mean and standard deviation.

# your code here


# ---- 4. Load a tourism dataset -----------------------------------------
# Load one ISTAC CSV placed under datasets/raw/ (downloaded via
# datasets/download.R). Inspect it with glimpse(), summary() and head().
# Print one or two sentences explaining:
#   - how many rows and columns it has,
#   - the types of each column,
#   - whether there are missing values.

library(tidyverse)
library(here)

# your code here


# ---- 5. Commit, push and open a PR -----------------------------------
# From a terminal in the project root:
#
#   git checkout -b day-1
#   git add exercises/day1/exercise-template.R
#   git commit -m "Day 1 solution"
#   git push -u origin day-1
#
# Then on GitHub, open a Pull Request from your fork's day-1 branch to
# chrglez:main with the title "Day 1 — Your Full Name".
# Full instructions in exercises/README.md.
