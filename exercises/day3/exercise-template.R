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

hotels <- library(tibble)

hotels <- tibble(
  island = c("Gran Canaria", "Tenerife", "Lanzarote",
             "Fuerteventura", "La Palma"),
  stars  = c(4L, 5L, 4L, 3L, 3L),
  price  = c(82, 95, 110, 100, 78),
  nights = c(12.5, 18.3, 9.8, 11.2, 6.4)
)

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

hotels <- library(tibble)

hotels <- tibble(
  island = c("Gran Canaria", "Tenerife", "Lanzarote",
             "Fuerteventura", "La Palma"),
  stars  = c(4L, 5L, 4L, 3L, 3L),
  price  = c(82, 95, 110, 100, 78),
  nights = c(12.5, 18.3, 9.8, 11.2, 6.4)
)

library(dplyr)

hotels |>
  summarise(
    n        = n(),
    mean     = mean(price, na.rm = TRUE),
    sd       = sd(price,   na.rm = TRUE),
    median   = median(price, na.rm = TRUE),
    q25      = quantile(price, 0.25, na.rm = TRUE),
    q75      = quantile(price, 0.75, na.rm = TRUE)
  )


library(janitor)

hotels |>
  tabyl(stars) |>
  adorn_totals("row") |>
  adorn_pct_formatting()

hotels |>
  tabyl(island, stars) |>
  adorn_totals("row") |>
  adorn_pct_formatting()

hotels_ex <- tibble(
  island = c("GC", "T", "L", "F", "LP", "GC", "T", "F", "GC", "F"),
  stars = c(4,5,4,3,3,3,4,4,5,4)
)


hotels_ex |>
  tabyl(island, stars) |>
  adorn_totals("row") |>
  adorn_percentages("row") |>
  adorn_pct_formatting()

hotels |>
  select(price, nights) |>
  cor(use = "pairwise.complete.obs")

hotels_ex |>
  tabyl(island, stars) |>
  adorn_totals("row") |>

table(hotels_ex$island, hotels_ex$stars)

hist(hotels$price)

hist(hotels$price,
     col    = "orange",
     main   = "Distribution of nightly price",
     xlab   = "Price (€)")

view(mtcars)
view(iris)
hist(mtcars$mpg,
     breaks = 3,
     main = "Cars by mpg",
     xlab = "",
     col = "green")

library(ggplot2)

library(ggplot2)

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(bins = 10, fill = "#0067a2", alpha = 0.95, color = "white") +
  labs(title = "cars by mpg",
       x = "mpg", y = "mtcars") +
  theme_minimal(base_size = 12)

boxplot(mtcars$mpg)

mtcars |>
summarise(
  n        = n(),
  mean     = mean(mpg, na.rm = TRUE),
  sd       = sd(mpg,   na.rm = TRUE),
  median   = median(mpg, na.rm = TRUE),
  q25      = quantile(mpg, 0.25, na.rm = TRUE),
  q75      = quantile(mpg, 0.75, na.rm = TRUE)
)

mtcars |>
  ggplot(aes(x=cars)) +
  geom_bar(fill = "darkgreen") +
  labs(x = "cars", y = "") +
  theme_minimal()

library(forcats)

hotels_ex |>
  mutate(ord_island = fct_infreq(island)) |>
  ggplot(aes (x=ord_island)) +
  geom_col(fill = "#0067a2") +
  labs(x = "hotels", y = island, titel = "Hotels by Island", subtitel = "Period 2006") +
  theme_minimal(base_size = 14)
