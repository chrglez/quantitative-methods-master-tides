# Day 1 · Exercise
# Topic: Git, GitHub and Data in R
# Author: Aida Sadat Ghamiloui
# GitHub: @aidaghamiloui
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

mean(c(2,4,8,16))

# ---- 3. Vectors --------------------------------------------------------
# Build a numeric vector with the monthly average temperatures in
# Las Palmas (°C) from a source of your choice. Compute its minimum,
# maximum, mean and standard deviation.

Monthly_tem <-   c(19, 18, 19, 20, 21, 23, 25, 25, 25, 24, 22, 20)

min(Monthly_tem)
max(Monthly_tem)
sd(Monthly_tem)




# ---- 4. Load a tourism dataset -----------------------------------------
# Load one ISTAC CSV placed under datasets/raw/ (downloaded via
# datasets/download.R). Inspect it with glimpse(), summary() and head().
# Print one or two sentences explaining:
#   - how many rows and columns it has,Rows: 24,739 - Columns: 7
#   - the types of each column,: character, Time period: Date Values: Numeric
#   - whether there are missing values. 16 missing values

library(tidyverse)
library(here)

library(readr)
eurostat_capacity_annual <- read_csv("datasets/raw/eurostat-capacity_annual.csv")
View(eurostat_capacity_annual)

glimpse(hotels)
glimpse(eurostat_capacity_annual)
summary(eurostat_capacity_annual)
head(eurostat_capacity_annual)





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
