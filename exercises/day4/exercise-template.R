# Day 4 · Exercise (graded)
# Topic: One-variable visualisation
# Author: Ilona Maier
# GitHub: @ilonamaier
# Date: 2026-05-29

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

# Keep only Spain
spain_data <- nights |>
  filter(geo == "ES")

# Create histogram with density curve
plot1 <- ggplot(spain_data, aes(x = nights)) +

  # Histogram
  geom_histogram(aes(y = after_stat(density)),
                 bins = 20, fill = "#0067a2", alpha = 0.55) +
  geom_density(linewidth = 1) +

  # Density line
  geom_density() +

  # Labels
  labs(
    title = "Distribution of Monthly Hotel Nights in Spain",
    x = "Monthly nights",
    y = "Density",
    caption = "Source: Eurostat (tour_occ_nim)"
  )

plot1

# Save plot
ggsave(
  here("exercises", "day4", "plot-1.png"),
  plot = plot1,
  width = 8,
  height = 5
)



# ---- 2. Boxplot --------------------------------------------------------
# Produce a boxplot of monthly `nights` for the SAME country across
# all available years. Highlight outliers (the default geom_boxplot
# already does). Save it to exercises/day4/plot-2.png.

# your code here

# Create boxplot
plot2 <- ggplot(spain_data, aes(x = nights)) +
  geom_boxplot(fill = "#f4f3ee") +
  labs(
    title = "Boxplot of Monthly Hotel Nights in Spain",
    x = "Monthly nights",
    caption = "Source: Eurostat (tour_occ_nim)"
  )

plot2

# Save plot
ggsave(
  here("exercises", "day4", "plot-2.png"),
  plot = plot2,
  width = 6,
  height = 5
)


# ---- 3. Categorical bar chart -----------------------------------------
# Compute total annual nights in 2024 per country (sum of the 12
# months of nights). Keep the top 15 countries by total nights and
# produce a horizontal bar chart ordered by frequency, with a
# meaningful title. Save to exercises/day4/plot-3.png.

# your code here

top_countries <- nights |>
  filter(year == 2024) |>
  filter(!geo %in% c("EU27_2020", "EA20", "EA", "EEA")) |>
  group_by(geo) |>
  summarise(total_nights = sum(nights, na.rm = TRUE)) |>
  slice_max(total_nights, n = 15) |>
  mutate(geo = reorder(geo, total_nights))

# Create horizontal bar chart
plot3 <- ggplot(top_countries,
                aes(x = geo, y = total_nights)) +

  # Bars
  geom_col() +

  # Colour
  geom_col(fill = "#0067a2") +

  # Flip coordinates
  coord_flip() +

  # Labels
  labs(
    title = "Top 15 EU Countries by Hotel Nights in 2024",
    x = "Country",
    y = "Total hotel nights",
    caption = "Source: Eurostat (tour_occ_nim)"
  )

plot3

# Save plot
ggsave(
  here("exercises", "day4", "plot-3.png"),
  plot = plot3,
  width = 8,
  height = 6
)


# ---- 4. Commentary -----------------------------------------------------
# In 5-8 sentences, describe what each plot reveals about the
# distribution and whether the three views are consistent.

# your comments here

# Plot 1 (Histogram + density): The distribution of monthly hotel nights
# in Spain is right-skewed, with most months clustering around 10-20
# million nights. The long tail to the right reflects a small number of
# peak summer months where nights exceed 40-50 million. This confirms
# strong seasonality in Spanish tourism.

# Plot 2 (Boxplot): The boxplot shows that the middle 50% of months fall
# roughly between 15 and 28 million nights. The whisker extending far to
# the right confirms the presence of high-season outliers. The median
# line sits closer to the left side of the box, consistent with the
# right-skewed distribution seen in Plot 1.

# Plot 3 (Bar chart): Spain leads with around 350 million hotel nights in 2024,
# followed by Germany and Italy. This concentration suggests that a
# handful of large tourism markets drive the majority of European hotel
# demand.
