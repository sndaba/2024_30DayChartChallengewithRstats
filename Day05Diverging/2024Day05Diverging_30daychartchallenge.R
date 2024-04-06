library(tidyverse)
library(ggplot2)
install.packages("gganimate")
library(gganimate)
install.packages("gifski")
library(gifski)

global_temps <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-07-11/global_temps.csv')

global <- data.frame(
  Year = global_temps$Year,
  April = global_temps$Apr
)


day5 <- ggplot(global, aes(x = Year, y = April)) +
  geom_bar(stat = "identity", show.legend = FALSE,aes(fill = April),  # Background color
           color = "gray30") + # Border color
  scale_x_continuous(breaks=seq(1880, 2023, 10), expand=c(0,0)) +
  scale_y_continuous(limits=c(-0.5, 1), expand=c(0,0)) +
  labs(title = "April Global Surface Temperature Change since 1880",
       caption = "source:  2023: GISS Surface Temperature Analysis | Graphic: Simi")+
  xlab("April") +
  ylab("Tempearture") +
  scale_fill_gradient2(low = "navyblue",mid = "aliceblue",high = "darkred")+
  theme_minimal()+
  theme(plot.title = element_text(colour ="white",   size = 16, hjust = 0.5, face = "bold"),
        plot.caption = element_text(color="white",size = 13, hjust = 1),
        plot.background = element_rect(fill = 'black'),
        axis.text.x = element_text(colour = "white"),
        axis.text.y = element_text(colour = "white"))+
  coord_flip()
day5

ggsave("2024Day05Diverging_30dayChartChallenge.png", height = 12, width = 10)

  transition_states(Year, wrap = FALSE) +
  shadow_mark()+
  enter_grow()
day5

animate(day5, height = 500, width=600)
anim_save("2024Day05Diverging.gif")