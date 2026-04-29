# Day 2 · Exercise (guided)
# Topic: Data wrangling with the tidyverse
# Author: Philipp Frick
# GitHub: @Philipp101299
# Date: 1999-04-29

library(tidyverse)
library(here)


# ---- 1. Load and combine ----------------------------------------------
# Load the two Eurostat files produced by datasets/download.R:
#
#   - eurostat-nights_monthly.csv   (nights spent, monthly)
#   - eurostat-capacity_annual.csv  (accommodation capacity, annual)
library(readr)
eurostat_capacity_annual <- read_csv("datasets/raw/eurostat-capacity_annual.csv")
View(eurostat_capacity_annual)

eurostat_nights_monthly <- read_csv("datasets/raw/eurostat-nights_monthly.csv")
View(eurostat_nights_monthly)
#
# Filter both tables to Spanish hotels in 2024:
#
#   nights:    c_resid   == "TOTAL"
#              unit      == "NR"
#              nace_r2   == "I551"
#              geo       == "ES"
#
#   capacity:  accomunit == "BEDPL"
#              unit      == "NR"
#              nace_r2   == "I551"
#              geo       == "ES"
#
# Eurostat code reference (what each filter means):
#   c_resid   = "TOTAL"  -> residents + non-residents combined; other
#                           values are DOM (residents only) and FOR
#                           (non-residents only).
#   unit      = "NR"     -> number, i.e. the raw count; other values
#                           are percentage changes vs prior periods
#                           (PCH_SM, PCH_PRE, PCH_SM_19, ...).
#   nace_r2   = "I551"   -> NACE Rev. 2 code for hotels and similar
#                           accommodation. Other values: I552 holiday
#                           and other short-stay accommodation,
#                           I553 camping grounds, I551-I553 total
#                           tourist accommodation.
#   geo       = "ES"     -> ISO country code for Spain.
#   accomunit = "BEDPL"  -> bed places (capacity in beds); BEDRM is
#                           bedrooms, ESTBL is establishments.
#
# Where to look up other Eurostat codes:
#   - In R, dimension by dimension:
#       eurostat::get_eurostat_dic("nace_r2")
#       eurostat::get_eurostat_dic("accomunit")
#     (returns a tibble with code_name and full_name).
#   - In a whole loaded dataset, replace codes with full labels:
#       eurostat::label_eurostat(nights)
#   - In the browser, with a dropdown next to each code:
#       https://ec.europa.eu/eurostat/databrowser/view/tour_occ_nim
#       https://ec.europa.eu/eurostat/databrowser/view/tour_cap_nat
#
# The time column is named `TIME_PERIOD` in both files. Extract the
# year with lubridate::year(TIME_PERIOD), keep only 2024, rename the
# `values` column on each side (e.g. `nights`, `bed_places`) and join
# on (geo, year). Use a left_join.

# your code here

library(lubridate)

nights_2024 <-  eurostat_nights_monthly |>
  mutate(year = year(TIME_PERIOD)) |>
  filter (year == 2024, c_resid   == "TOTAL", unit      == "NR", nace_r2   == "I551") |>
  select(TIME_PERIOD, year, nights = values, geo)

capacity_2024 <-  eurostat_capacity_annual |>
  mutate(year = year(TIME_PERIOD))|>
  filter (year == 2024, accomunit == "BEDPL", unit      == "NR", nace_r2   == "I551") |>
  select(TIME_PERIOD, year, capacity = values, geo)

joined_data <-  inner_join(nights_2024,
                          capacity_2024,
                          by = c("TIME_PERIOD", "year", "geo"))


# ---- 2. Engineer features ---------------------------------------------
# Compute a monthly occupancy index for Spain in 2024:
#
#   occupancy_index = nights / bed_places
#
# It expresses the average number of nights per bed place per month —
# values close to 30 mean an effectively full month, values near zero
# mean an empty month.

# your code here

occupancy <-  joined_data |>
mutate(occupancy_index = nights / capacity)

# ---- 3. Summarise ------------------------------------------------------
# Build a tibble with one row per month showing the occupancy index
# in 2024, sorted in descending order. Display only `time` and
# `occupancy_index`.

# your code here

sorted_occ <- occupancy |>
  arrange(desc(occupancy_index))


# ---- 4. Comment --------------------------------------------------------
# In 4-6 lines as comments, describe what the table shows: which months
# are highest and lowest, whether the seasonal pattern matches what you
# would expect for Spain, and one plausible tourism explanation.

# your comments here

The capacity index is the highest in Austria because of the Winter season in the alps. Same occurs for switzerland.The ocupancz rate for spain will be probaly quite low because in spain january is no high season except maybe of the Canary islands.
