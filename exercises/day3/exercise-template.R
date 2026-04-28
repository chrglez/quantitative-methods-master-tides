# Day 3 · Exercise (graded)
# Topic: Basic statistics with R
# Author: Your Name
# GitHub: @yourhandle
# Date: YYYY-MM-DD

library(tidyverse)
library(janitor)
library(here)


# ---- 1. Descriptives ---------------------------------------------------
# Using ISTAC or Eurostat data, produce a summary table (n, mean, SD,
# median, Q1, Q3, missing) for two continuous tourism variables of your
# choice, broken down by a categorical grouping variable
# (e.g. island, country, quarter).

hotels <- tibble(
  island = c("Gran Canaria", "Tenerife", "Lanzarote",
             "Fuerteventura", "La Palma"),
  stars  = c(4L, 5L, 4L, 3L, 3L),
  price  = c(82, 95, 110, 100, 78),
  nights = c(12.5, 18.3, 9.8, 11.2, 6.4)
)

hotel


# ---- 2. Cross-tabulation -----------------------------------------------
# Build one cross-tabulation with row percentages. Briefly comment on
# any striking cell.

# your code here

# your comment here


# ---- 3. Correlation ----------------------------------------------------
# Pick three numeric tourism variables (e.g. price, nights, occupancy
# rate). Compute their correlation matrix with
# cor(use = "pairwise.complete.obs") and identify the strongest and
# weakest pairs.

# your code here


# ---- 4. Interpretation -------------------------------------------------
# In 4–6 sentences, describe the strongest correlation you found:
# direction, magnitude, and a plausible substantive reason. Note
# explicitly that correlation is NOT causation — Module III with Juan
# covers how to test causal claims formally.

# your comments here
