# Day 3 · Exercise (graded)
# Topic: Basic statistics with R
# Author: Philipp
# GitHub: Philipp101299
# Date: 2026-04-29

library(tidyverse)
library(janitor)
library(here)


# ---- Data --------------------------------------------------------------
# Load and join the two Eurostat tables you already used on Day 2.
# Filter to hotels (nace_r2 == "I551"), 2024, residency total. The
# time column is `TIME_PERIOD`, the value column is `values`. Full
# code reference is in `exercises/day2/exercise-template.R`.

library(readr)
eurostat-nights_monthly <- read_csv("datasets/raw/eurostat-nights_monthly.csv")
View(eurostat-nights_monthly)

library(readr)
eurostat-capacity_annual <- read_csv("datasets/raw/eurostat-capacity_annual.csv")
View(eurostat-capacity_annual)

eurostat_nights_monthly<- read_csv(here("datasets", "raw", "eurostat-nights_monthly.csv")) |>
  filter(c_resid == "TOTAL", unit == "NR", nace_r2 == "I551") |>
  mutate(year = lubridate::year(TIME_PERIOD)) |>
  filter(year == 2024) |>
  select(geo, year, time = TIME_PERIOD, nights = values)

eurostat_capacity_annual <- read_csv(here("datasets", "raw", "eurostat-capacity_annual.csv")) |>
  filter(accomunit == "BEDPL", unit == "NR", nace_r2 == "I551") |>
  mutate(year = lubridate::year(TIME_PERIOD)) |>
  filter(year == 2024) |>
  select(geo, year, bed_places = values)

joined <- eurostat_nights_monthly |>
  left_join(eurostat_capacity_annual, by = c("geo", "year")) |>
  mutate(occupancy_index = nights / bed_places)

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


eurostat_nights <- read_csv(here("datasets", "raw", "eurostat-nights_monthly.csv")) |>
  filter(c_resid %in% c("DOM", "FOR"),
         unit == "NR",
         nace_r2 == "I551") |>
  mutate(year = year(TIME_PERIOD)) |>
  filter(year == 2024) |>
  select(geo, year, c_resid, nights = values)

nights_sum <- eurostat_nights |>
  group_by(geo, c_resid) |>
  summarise(nights = sum(nights, na.rm = TRUE), .groups = "drop")

library(tidyr)

nights_wide <- nights_sum |>
  pivot_wider(
    names_from = c_resid,
    values_from = nights
  )

nights_pct <- nights_wide |>
  mutate(
    total = DOM + FOR,
    DOM_pct = DOM / total * 100,
    FOR_pct = FOR / total * 100
  )
result <- nights_pct |>
  filter(geo %in% c("ES", "DE", "FR", "IT", "NL", "AT")) |>
  select(geo, DOM_pct, FOR_pct)
result
Spain with 2/3 of forgein tourists shows the strong dependence on the tourism sector especially from tourists coming from nothern europe countries.

# ---- 3. Correlation ---------------------------------------------------
# Collapse `joined` to one row per country in 2024 with three numeric
# indicators:
#   - annual_nights  = sum(nights)
#   - bed_places     = mean(bed_places)   # constant within a country-year
#   - nights_per_bed = annual_nights / bed_places
# Compute the correlation matrix of those three columns with
# cor(use = "pairwise.complete.obs") and identify the strongest and
# weakest pairs.

library(dplyr)

country_data <- joined |>
  group_by(geo) |>
  summarise(
    annual_nights = sum(nights, na.rm = TRUE),
    bed_places = mean(bed_places, na.rm = TRUE),
    .groups = "drop"
  )
country_data <- country_data |>
  mutate(nights_per_bed = annual_nights / bed_places)

cor_matrix <- country_data |>
  select(annual_nights, bed_places, nights_per_bed) |>
  cor(use = "pairwise.complete.obs")
cor_matrix
Strong correlation bewteen annual_nights and bed_places
 because countries with many beds also more overnight stays. The correlation between nights_per_bed and the other two is low becuase many beds does not mean high occupancy.
