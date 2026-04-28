# Day 2 · Exercise (guided)
# Topic: Data wrangling with the tidyverse
# Author: Your Name
# GitHub: @yourhandle
# Date: YYYY-MM-DD

library(tidyverse)
library(here)


# ---- 1. Load and combine ----------------------------------------------
# Load the two Eurostat files produced by datasets/download.R:
#
#   - eurostat-nights_monthly.csv   (nights spent, monthly)
#   - eurostat-capacity_annual.csv  (accommodation capacity, annual)
#
# Filter both tables to Spanish hotels in 2024:
#
#   nights:    c_resid == "TOTAL"
#              unit    == "NR"
#              nace_r2 == "I551"
#              geo     == "ES"
#
#   capacity:  unit    == "BEDPL"
#              nace_r2 == "I551"
#              geo     == "ES"
#
# Extract the year from `time` with lubridate::year(), keep only 2024,
# rename the `values` column on each side (e.g. `nights`, `bed_places`)
# and join on (geo, year). Use a left_join.

# your code here


# ---- 2. Engineer features ---------------------------------------------
# Compute a monthly occupancy index for Spain in 2024:
#
#   occupancy_index = nights / bed_places
#
# It expresses the average number of nights per bed place per month —
# values close to 30 mean an effectively full month, values near zero
# mean an empty month.

# your code here


# ---- 3. Summarise ------------------------------------------------------
# Build a tibble with one row per month showing the occupancy index
# in 2024, sorted in descending order. Display only `time` and
# `occupancy_index`.

# your code here


# ---- 4. Comment --------------------------------------------------------
# In 4-6 lines as comments, describe what the table shows: which months
# are highest and lowest, whether the seasonal pattern matches what you
# would expect for Spain, and one plausible tourism explanation.

# your comments here
