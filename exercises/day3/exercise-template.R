# Day 3 · Exercise (graded)
# Topic: Basic statistics with R
# Author: Your Name
# GitHub: @yourhandle
# Date: YYYY-MM-DD

library(tidyverse)
library(janitor)
library(here)


# ---- Data --------------------------------------------------------------
# Load and join the two Eurostat tables you already used on Day 2.
# Filter to hotels (nace_r2 == "I551"), 2024, residency total. The
# time column is `TIME_PERIOD`, the value column is `values`. Full
# code reference is in `exercises/day2/exercise-template.R`.

nights <- read_csv(here("datasets", "raw", "eurostat-nights_monthly.csv")) |>
  filter(c_resid == "TOTAL", unit == "NR", nace_r2 == "I551") |>
  mutate(year = lubridate::year(TIME_PERIOD)) |>
  filter(year == 2024) |>
  select(geo, year, time = TIME_PERIOD, nights = values)

capacity <- read_csv(here("datasets", "raw", "eurostat-capacity_annual.csv")) |>
  filter(accomunit == "BEDPL", unit == "NR", nace_r2 == "I551") |>
  mutate(year = lubridate::year(TIME_PERIOD)) |>
  filter(year == 2024) |>
  select(geo, year, bed_places = values)

joined <- nights |>
  left_join(capacity, by = c("geo", "year")) |>
  mutate(occupancy_index = nights / bed_places)


# ---- 1. Descriptives ---------------------------------------------------
# From `joined`, produce a summary table with n, mean, SD, median, Q1,
# Q3 and count of missing values for both `nights` and
# `occupancy_index`, grouped by country (`geo`). Keep only countries
# with at least 6 monthly observations and sort by mean nights
# descending.

# your code here


# ---- 2. Cross-tabulation ----------------------------------------------
# Eurostat data comes pre-aggregated, so a true cross-tab needs to be
# built manually. Re-load the monthly nights file, this time keeping
# c_resid == "DOM" (residents only) and c_resid == "FOR" (non-residents
# only) instead of TOTAL, with nace_r2 == "I551" for 2024.
# Sum nights per (geo, c_resid), pivot wider so each residency type is
# a column, and compute row percentages so each country sums to 100 %.
# Print the result for 6-10 EU countries of your choice. In one or two
# lines, comment on a striking cell — e.g. a country with overwhelmingly
# domestic tourism, or one dominated by foreign visitors.

# your code here

# your comment here


# ---- 3. Correlation ---------------------------------------------------
# Collapse `joined` to one row per country in 2024 with three numeric
# indicators:
#   - annual_nights  = sum(nights)
#   - bed_places     = mean(bed_places)   # constant within a country-year
#   - nights_per_bed = annual_nights / bed_places
# Compute the correlation matrix of those three columns with
# cor(use = "pairwise.complete.obs") and identify the strongest and
# weakest pairs.

# your code here


# ---- 4. Interpretation -------------------------------------------------
# In 4-6 sentences, describe the strongest correlation you found:
# direction, magnitude, and a plausible substantive reason. Note
# explicitly that correlation is NOT causation — Module III with Juan
# covers how to test causal claims formally.

# your comments here
