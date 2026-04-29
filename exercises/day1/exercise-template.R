# Day 1 · Exercise
# Topic: GitHub and Data in R
# Author: Ilona Maier
# GitHub: @ilonamaier
# Date: 2026-04-29

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

sum(1:100)
exp(mean(log(c(2,4,8,16))))

# ---- 3. Vectors --------------------------------------------------------
# Build a numeric vector with the monthly average temperatures in
# Las Palmas (°C) from a source of your choice. Compute its minimum,
# maximum, mean and standard deviation.

# your code here

temperature <- c(16, 15.9, 16.6, 17.2, 18.3, 19.7, 20.9, 22, 21.9, 21.2, 19, 17.4)

range(temperature)
mean(temperature)
sd(temperature)

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

source("datasets/download.R")
glimpse(dat)
summary(dat)
head(dat)

sum(is.na(dat))
sum(is.na(dat$values))

# The dataframe "dat" has 24,739 rows and 7 columns.
# Col 1-5 are characters. Col 6 is date. Col 7 is numeric (double)
# There are 16 missing values. They are all in the values column.

# ---- 5. Commit, push and open a PR -----------------------------------
# In RStudio (all from the Git pane on the top-right):
#
#   1. Branch dropdown → New Branch → name "day-1", tick "Sync branch
#      with remote" → Create.
#   2. Save this file, tick its checkbox in the Git pane.
#   3. Click Commit, write "Day 1 solution", click Commit.
#   4. Click Push (green up arrow).
#
# Then on github.com/<you>/quantitative-methods-master-tides, click
# "Compare & pull request" and set the title "Day 1 — Your Full Name".
# Full instructions in exercises/README.md.
