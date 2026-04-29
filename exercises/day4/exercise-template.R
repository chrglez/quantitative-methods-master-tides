# Day 4 · Exercise (graded)
# Topic: One-variable visualisation
# Author: Your Name
# GitHub: @yourhandle
# Date: YYYY-MM-DD

library(tidyverse)
library(here)
theme_set(theme_minimal(base_size = 12))


# ---- Data --------------------------------------------------------------
# Load the Eurostat monthly nights file (same filters as Day 2):
#   c_resid == "TOTAL", unit == "NR", nace_r2 == "I551".
# The time column is `TIME_PERIOD`. Full code reference in
# `exercises/day2/exercise-template.R`.

nights <- read_csv(here("datasets", "raw", "eurostat-nights_monthly.csv")) |>
  filter(c_resid == "TOTAL", unit == "NR", nace_r2 == "I551") |>
  mutate(year  = lubridate::year(TIME_PERIOD),
         month = lubridate::month(TIME_PERIOD)) |>
  rename(time = TIME_PERIOD, nights = values)


# ---- 1. Histogram + density -------------------------------------------
# Pick one EU country (geo) and produce a combined histogram and
# density plot of monthly `nights` for all available years. Label
# axes and units, and include a "Source: Eurostat (tour_occ_nim)"
# caption. Save the plot to exercises/day4/plot-1.png via ggsave().

# your code here


# ---- 2. Boxplot --------------------------------------------------------
# Produce a boxplot of monthly `nights` for the SAME country across
# all available years. Highlight outliers (the default geom_boxplot
# already does). Save it to exercises/day4/plot-2.png.

# your code here


# ---- 3. Categorical bar chart -----------------------------------------
# Compute total annual nights in 2024 per country (sum of the 12
# months of nights). Keep the top 15 countries by total nights and
# produce a horizontal bar chart ordered by frequency, with a
# meaningful title. Save to exercises/day4/plot-3.png.

# your code here


# ---- 4. Commentary -----------------------------------------------------
# In 5-8 sentences, describe what each plot reveals about the
# distribution and whether the three views are consistent.

# your comments here
