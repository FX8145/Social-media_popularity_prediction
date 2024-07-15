library(ggplot2)
library(dplyr)
library(tibble)
library(tidyr)

set.seed(123)
dates <- seq(as.Date("2023-01-01"), by = "month", length.out = 6)
social_media_platforms <- c("Facebook", "Instagram", "Twitter", "Snapchat", "TikTok", "LinkedIn")
popularity_data <- expand.grid(date = dates, platform = social_media_platforms) %>%
  mutate(popularity = round(rnorm(n(), mean = 500, sd = 100)))  # Simulated popularity data

# Visualization
# Line Plot for Popularity Data
ggplot(popularity_data, aes(x = date, y = popularity, color = platform, group = platform)) +
  geom_line() +
  facet_wrap(~ platform, scales = "free_y") +
  labs(title = "Social Media Popularity by Platform", x = "Date", y = "Popularity") +
  theme_minimal() +
  theme(legend.position = "bottom")

# Box Plot for Popularity Distribution by Platform
ggplot(popularity_data, aes(x = platform, y = popularity, fill = platform)) +
  geom_boxplot() +
  labs(title = "Distribution of Popularity by Social Media Platform", x = "Platform", y = "Popularity") +
  theme_minimal()

# Histogram for Overall Popularity Distribution
ggplot(popularity_data, aes(x = popularity)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Popularity", x = "Popularity", y = "Frequency") +
  theme_minimal()
