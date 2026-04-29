# Day 2 · Exercise (guided)
# Topic: Data wrangling with the tidyverse
# Author: Ilona Miaer
# GitHub: @ilonamaier
# Date: 2026-04-29

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


library(readr)
nights <- read_csv("datasets/raw/eurostat-nights_monthly.csv")
capacity <- read_csv("datasets/raw/eurostat-capacity_annual.csv")

capacity <- dat    #not sure if I need to keep this in the code. I used it the first time I downloaded the data to rename the variables, but now an error appears when running the script, as the name has already changed.
nights <- manifest

capacity <- capacity |>               # this is important so that the result is stored in the variable and not only shown in the console
  filter(accomunit == "BEDPL", unit      == "NR", nace_r2   == "I551", geo       == "ES")
nights <- nights |>
  filter(c_resid   == "TOTAL", unit      == "NR", nace_r2   == "I551", geo       == "ES")

library(lubridate)
nights <- nights |>
  mutate(year=year(TIME_PERIOD))
capacity <- capacity |>
  mutate(year=year(TIME_PERIOD))

nights <- nights |>
  rename(nights=values)
capacity <- capacity |>
  rename(bed_places=values)

final <- nights |>
  inner_join(capacity,by=c("geo","year","TIME_PERIOD"))

final <- final |>
  select(year,nights,geo,bed_places,TIME_PERIOD)


# ---- 2. Engineer features ---------------------------------------------
# Compute a monthly occupancy index for Spain in 2024:
#
#   occupancy_index = nights / bed_places
#
# It expresses the average number of nights per bed place per month —
# values close to 30 mean an effectively full month, values near zero
# mean an empty month.

# your code here

final <- final|>
  mutate(occupancy_index=nights/bed_places)

# ---- 3. Summarise ------------------------------------------------------
# Build a tibble with one row per month showing the occupancy index
# in 2024, sorted in descending order. Display only `time` and
# `occupancy_index`.

# your code here

sorted_final <- final |>
  arrange(desc(occupancy_index)) |>
  select(year,occupancy_index) |>
  rename(time=year)


#need to check if the following code is correct.

Occupancy <- final |>
  mutate(month = month(TIME_PERIOD)) |>
  group_by(month) |>
  summarise(occupancy_index = sum(nights) / sum(bed_places)) |>
  arrange(desc(occupancy_index)) |>
  select(month, occupancy_index)



# ---- 4. Comment --------------------------------------------------------
# In 4-6 lines as comments, describe what the table shows: which months
# are highest and lowest, whether the seasonal pattern matches what you
# would expect for Spain, and one plausible tourism explanation.

# your comments here

# It makes sense that the occupancy in 2020 was the lowest. However, it doesn't
# make sense, that it was almost as low in 2024, as tourism grew rapidly after
# Covid 19. One possible explenation is, that the full data for 2024 didn't
# exist yet when the data was downloaded. This makes sense, taking into account,
# that the last data available in the
# dataframe is from 2024.



