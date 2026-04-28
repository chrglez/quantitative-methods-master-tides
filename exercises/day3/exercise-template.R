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

hotels <- library(tibble)

hotels <- tibble(
  island = c("Gran Canaria", "Tenerife", "Lanzarote",
             "Fuerteventura", "La Palma"),
  stars  = c(4L, 5L, 4L, 3L, 3L),
  price  = c(82, 95, 110, 100, 78),
  nights = c(12.5, 18.3, 9.8, 11.2, 6.4)
)

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
