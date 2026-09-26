# Week 2 - Data Visualization and Insight Communication using R
# Dataset: mtcars (built-in R dataset)

# Install once if ggplot2 is not already installed:
# install.packages("ggplot2")
library(ggplot2)

data(mtcars)
df <- mtcars

# 1. Bar chart: average MPG by cylinder count
avg_mpg <- aggregate(mpg ~ cyl, data = df, FUN = mean)

ggplot(avg_mpg, aes(x = factor(cyl), y = mpg)) +
  geom_col() +
  labs(
    title = "Average Fuel Efficiency by Cylinder Count",
    x = "Number of cylinders",
    y = "Average MPG"
  ) +
  theme_minimal()

# 2. Scatter plot: vehicle weight vs MPG
ggplot(df, aes(x = wt, y = mpg)) +
  geom_point(size = 2.5) +
  labs(
    title = "Vehicle Weight vs Fuel Efficiency",
    x = "Vehicle weight (1000 lbs)",
    y = "Miles per gallon (MPG)"
  ) +
  theme_minimal()

# 3. Line chart: MPG across the observations
df$vehicle_no <- seq_len(nrow(df))

ggplot(df, aes(x = vehicle_no, y = mpg)) +
  geom_line() +
  geom_point() +
  labs(
    title = "Fuel Efficiency Across the 32 Vehicles",
    x = "Vehicle observation number",
    y = "MPG"
  ) +
  theme_minimal()

# 4. Histogram: horsepower distribution
ggplot(df, aes(x = hp)) +
  geom_histogram(bins = 8, color = "black") +
  labs(
    title = "Distribution of Horsepower",
    x = "Horsepower",
    y = "Number of vehicles"
  ) +
  theme_minimal()

# Optional numerical insight
cor(df$wt, df$mpg)
