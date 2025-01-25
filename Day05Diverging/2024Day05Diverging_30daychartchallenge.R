# Load necessary libraries
library(ggplot2)
library(gganimate)
library(readr)

# Load the data
global_temps <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-07-11/global_temps.csv')

# Prepare the data
global <- data.frame(
  Year = global_temps$Year,
  April = global_temps$Apr
)

# Create the animated plot
day5 <- ggplot(global, aes(x = Year, y = April)) +
  geom_bar(stat = "identity", aes(fill = April), color = "gray30", show.legend = FALSE) + 
  scale_x_continuous(breaks = seq(1880, 2023, 10), expand = c(0, 0)) +
  scale_y_continuous(limits = c(-0.5, 1), expand = c(0, 0)) +
  labs(
    title = "April Global Surface Temperature Change since 1880",
    subtitle = "Year: {closest_state}",
    caption = "Source: GISS Surface Temperature Analysis | Graphic: Simi",
    x = "Year",
    y = "Temperature Change (°C)"
  ) +
  scale_fill_gradient2(low = "navyblue", mid = "aliceblue", high = "darkred") +
  theme_minimal() +
  theme(
    plot.title = element_text(colour = "white", size = 16, hjust = 0.5, face = "bold"),
    plot.subtitle = element_text(color = "white", size = 14, hjust = 0.5),
    plot.caption = element_text(color = "white", size = 12, hjust = 1),
    plot.background = element_rect(fill = "black", color = NA),
    axis.text.x = element_text(colour = "white"),
    axis.text.y = element_text(colour = "white")
  ) +
  coord_flip() +
  transition_states(Year, transition_length = 1, state_length = 1) +
  shadow_mark(alpha = 0.3, size = 0.5)

# Animate and save the plot
animated_plot <- animate(day5, height = 500, width = 600, fps = 20, duration = 10, renderer = gifski_renderer())
animated_plot
anim_save("05.gif", animation = animated_plot)
