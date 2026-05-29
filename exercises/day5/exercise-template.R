# Day 5 · Exercise (graded)
# Topic: Multi-variable visualisation
# Author: Ilona Maier
# GitHub: @ilonamaier
# Date: 2026-05-29

library(tidyverse)
library(here)
theme_set(theme_minimal(base_size = 12))

# ---- Data --------------------------------------------------------------
# Load Eurostat hotel nights data
nights <- read_csv(here("datasets", "raw", "eurostat-nights_monthly.csv")) |>
  filter(c_resid == "TOTAL", unit == "NR", nace_r2 == "I551") |>
  mutate(
    year  = lubridate::year(TIME_PERIOD),
    month = lubridate::month(TIME_PERIOD)
  ) |>
  rename(time = TIME_PERIOD, nights = values)

# Load hotel capacity data
capacity <- read_csv(here("datasets", "raw", "eurostat-capacity_annual.csv")) |>
  filter(accomunit == "BEDPL", unit == "NR", nace_r2 == "I551") |>
  mutate(year = lubridate::year(TIME_PERIOD)) |>
  rename(time = TIME_PERIOD, bed_places = values)

# Join datasets
joined <- nights |>
  left_join(
    capacity |> select(geo, year, bed_places),
    by = c("geo", "year")
  ) |>

  # Create occupancy measure
  mutate(occupancy_index = nights / bed_places)


# ---- 1. Scatter with grouping ------------------------------------------
# Produce a scatterplot of two continuous tourism variables, coloured
# by a categorical variable, with a linear smoother per group.
# Save as exercises/day5/plot-1.png.

# your code here

# Keep only 2024 data
scatter_data <- joined |>
  filter(year == 2024)

# Create scatterplot
plot1 <- ggplot(
  scatter_data,
  aes(
    x = bed_places,
    y = nights,
    color = factor(month)
  )
) +

  # Points
  geom_point(alpha = 0.7) +

  # Linear trend line for each month
  geom_smooth(method = "lm", se = FALSE) +

  # Labels
  labs(
    title = "Hotel Nights and Bed Capacity in 2024",
    x = "Bed places",
    y = "Monthly hotel nights",
    color = "Month",
    caption = "Source: Eurostat"
  )

plot1

# Save plot
ggsave(
  here("exercises", "day5", "plot-1.png"),
  plot = plot1,
  width = 8,
  height = 6
)

# ---- 2. Faceted distribution ------------------------------------------
# Pick a continuous variable and a grouping variable with 4–8 levels.
# Produce small-multiples (faceted boxplots or violins) comparing the
# distribution across groups.
# Save as exercises/day5/plot-2.png.

# your code here

# Keep selected countries
facet_data <- joined |>
  filter(geo %in% c("ES", "FR", "DE", "IT", "PT", "EL"))

# Create faceted boxplots
plot2 <- ggplot(
  facet_data,
  aes(x = geo, y = nights)
) +

  # Boxplots
  geom_boxplot() +

  # One panel per country
  facet_wrap(~ geo) +

  # Labels
  labs(
    title = "Distribution of Monthly Hotel Nights by Country",
    x = "Country",
    y = "Monthly hotel nights",
    caption = "Source: Eurostat"
  )

plot2

# Save plot
ggsave(
  here("exercises", "day5", "plot-2.png"),
  plot = plot2,
  width = 9,
  height = 6
)



# ---- 3. Correlation panel ----------------------------------------------
# Build a correlation heatmap for at least five numeric variables of
# your chosen dataset. Comment on the two strongest correlations.
# Save as exercises/day5/plot-3.png.

# your code here

# Create country-level indicators
cor_data <- joined |>
  group_by(geo, year) |>
  summarise(
    annual_nights = sum(nights, na.rm = TRUE),
    mean_nights = mean(nights, na.rm = TRUE),
    sd_nights = sd(nights, na.rm = TRUE),
    bed_places = mean(bed_places, na.rm = TRUE),
    occupancy_index = mean(occupancy_index, na.rm = TRUE)
  )

# Compute correlation matrix
cor_matrix <- cor_data |>
  ungroup() |>
  select(annual_nights, mean_nights, sd_nights, bed_places, occupancy_index) |>
  cor(use = "pairwise.complete.obs")


# Convert matrix to long format
cor_long <- as.data.frame(as.table(cor_matrix)) |>
  rename(Var1 = Var1, Var2 = Var2, n = Freq)

# Create heatmap
plot3 <- ggplot(
  cor_long,
  aes(
    x = Var1,
    y = Var2,
    fill = n
  )
) +

  # Heatmap tiles
  geom_tile() +

  # Correlation labels
  geom_text(aes(label = round(n, 2))) +

  # Labels
  labs(
    title = "Correlation Heatmap",
    x = "",
    y = "",
    fill = "Correlation",
    caption = "Source: Eurostat"
  )

plot3

# Save plot
ggsave(
  here("exercises", "day5", "plot-3.png"),
  plot = plot3,
  width = 8,
  height = 6
)

# your comments here

# The strongest correlation is between annual_nights and mean_nights
# (r = 0.99), which makes sense as both measure the same underlying
# volume of tourism. The second strongest is between bed_places and
# sd_nights (r = 0.99), suggesting that countries with more hotel
# capacity also show greater month-to-month variation in nights —
# likely because large tourism markets have stronger seasonal swings.

# ---- 4. Interpretation -------------------------------------------------
# In 8–10 sentences, describe what combining the three views tells you
# about the data. What would you test next in a regression model?

# your comments here

# Plot 1 shows a strong positive relationship between bed capacity and
# hotel nights across all months. Countries with more bed places
# consistently record more hotel nights, and summer months (7 and 8)
# show the steepest slopes, confirming that large-capacity countries
# benefit the most from peak season. Plot 2 reveals clear differences
# in tourism volume and variability between countries. Spain shows the
# widest range, reflecting strong seasonality, while Portugal has much
# lower and more stable monthly figures. Plot 3 confirms that tourism
# volume indicators are almost perfectly correlated with each other,
# which makes sense as they all measure the same underlying phenomenon.
