here::i_am(
  "code/02_make_plots.R"
)

data <- readRDS(
  file = here::here("data/data_clean.rds")
)

# Graphical analysis

#| fig.align = "center",

# Load necessary libraries for plotting
library(ggplot2)

# Create a bar plot for the distribution of obesity levels
figure_one <- ggplot(data, aes(x = NObeyesdad)) +
  geom_bar(aes(fill = NObeyesdad)) +
  theme_minimal() +
  labs(title = "Distribution of Obesity Levels", x = "Obesity Level", y = "Count")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave(
  figure_one,
  file = here::here("figures/figure_one.png")
)

#| fig.align = "center",

# Create a scatter plot for Height and NCP(number of main meals)
figure_two <- ggplot(data, aes(x = Height, y = NCP)) +
  geom_point(aes(color=Height)) +
  geom_smooth(method = lm) +
  theme_bw()+
  labs(title = "Height vs NCP", x = "Obesity Level", y = "Number of main meals daily")

ggsave(
  figure_two,
  file = here::here("figures/figure_two.png")
)