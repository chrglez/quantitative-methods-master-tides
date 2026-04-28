# Day 3 · Exercise (graded)
# Topic: Basic statistics with R
# Author: Ilona Maier
# GitHub: @ilonamaier
# Date: 2026-04-28

install.packages("janitor")

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

library(dplyr)

hotels <- tibble(
  island = c("Gran Canaria", "Tenerife", "Lanzarote",
             "Fuerteventura", "La Palma"),
  stars  = c(4L, 5L, 4L, 3L, 3L),
  price  = c(82, 95, 110, 100, 78),
  nights = c(12.5, 18.3, 9.8, 11.2, 6.4)
)

hotels

hotels |>                                             # |> in this case means: take the variable hotels and do this next... same as %>% (in almost all of the cases)
  summarise(                                          # instead of many rows you get one row with statistics.
    n        = n(),                                   # count how many rows there are.
    mean     = mean(price, na.rm = TRUE),             # We get the mean price of the hotels
    sd       = sd(price,   na.rm = TRUE),
    median   = median(price, na.rm = TRUE),
    q25      = quantile(price, 0.25, na.rm = TRUE),
    q75      = quantile(price, 0.75, na.rm = TRUE)
  )

summary(hotels)

mean(hotels$price,na.rm=TRUE)

library(janitor)

hotels |>
  tabyl(stars) |>
  adorn_totals("row")|>
  adorn_pct_formatting()

hotels |>
  tabyl(island) |>
  adorn_totals("row")|>
  adorn_pct_formatting()


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

hotels |>
  tabyl(island,stars) |>
  adorn_percentages("row") |>
  adorn_totals("col")|>
  adorn_pct_formatting()

hotels |>
  tabyl(island,stars) |>
  adorn_percentages("row")

hotels_example <- tibble(
  island=c("GC","T","L","F","LP","GC","T","F","GC","F"),
  stars=c(4,5,4,3,3,3,4,4,5,4)
)

hotels_example |>
  tabyl(island,stars) |>
  adorn_percentages("row")|>
  adorn_totals("col") |>
  adorn_pct_formatting()

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

hotels |>
  select(price, nights) |>
  cor(use = "pairwise.complete.obs")

# ---- 4. Interpretation -------------------------------------------------
# In 4-6 sentences, describe the strongest correlation you found:
# direction, magnitude, and a plausible substantive reason. Note
# explicitly that correlation is NOT causation — Module III with Juan
# covers how to test causal claims formally.

# your comments here




#---- One-variable visualisation ----------------------------------------

hist(hotels$price,
     col="aquamarine"
     )

hist(hotels$price)

hist(hotels$price,
     breaks=20,
     col="aquamarine",
     main="Distribution of nightly price",
     xlab="Price in €"
)

view(mtcars)
view(iris)

hist(mtcars$mp)

hist(mtcars$mpg,
     breaks=10,
     col="aquamarine",
     main="example",
     xlab="mpg"
     )

library(ggplot2)

mtcars |>
ggplot(aes(x=mpg))+
  geom_histogram(bins=10,
                 fill="#0067a2",
                  alpha=0.85)+
  labs(title = "Cars by mpg",
       x = "mpg", y = "xxx") +
  theme_minimal(base_size = 12)

boxplot(mtcars$mpg,col="brown")

ggplot(mtcars, aes(y = mpg)) +
  geom_boxplot(fill = "#f4f3ee") +
  coord_flip() +
  theme_minimal()

mtcars |>
  ggplot(aes(x=cyl))+
  geom_bar(fill="blue")+
  labs(x="cars",y=NULL)+
  theme_minimal()

hotels_example |>
  mutate(ord_island=fct_infreq(island))|>
  ggplot(aes(x=ord_island))+
  geom_bar(fill="blue")


