# Day 3 · Exercise (graded)
# Topic: Basic statistics with R
# Author: Your Name
# GitHub: @yourhandle
# Date: YYYY-MM-DD

library(tidyverse)
library(janitor)
library(broom)
library(here)


# ---- 1. Descriptives ---------------------------------------------------
# Using ISTAC or Eurostat data, produce a summary table (n, mean, SD,
# median, Q1, Q3, missing) for two continuous tourism variables of your
# choice, broken down by a categorical grouping variable
# (e.g. island, country, quarter).

# your code here

hotels <- tibble(
  island = c("Gran Canaria", "Tenerife", "Lanzarote",
             "Fuerteventura", "La Palma"),
  stars  = c(4L, 5L, 4L, 3L, 3L),
  price  = c(82, 95, 110, 100, 78),
  nights = c(12.5, 18.3, 9.8, 11.2, 6.4)
)

hotels


# ---- 2. Cross-tabulation -----------------------------------------------
# Build one cross-tabulation with row percentages. Briefly comment on
# any striking cell.

# your code here

# your comment here


# ---- 3. A comparison test ----------------------------------------------
# State a hypothesis of the form "mean of Y in group A equals mean of
# Y in group B" and test it with a two-sample t-test. Report the point
# estimates, confidence interval and p-value using broom::tidy().

# your hypothesis:

# your code here


# ---- 4. Interpretation -------------------------------------------------
# Interpret the test in plain English for a non-statistical tourism
# reader (4–6 sentences). Say what "statistically significant" means
# and what it does NOT mean.

# your comments here
