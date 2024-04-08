install.packages("packcircles")
library(tidyverse)
library(ggplot2)
library(packcircles)

day06 <- readr::read_csv("real_min_wage.csv")
view(day06)

day6 <- data.frame(Country = day06$Country,
                   Time = day06$Time,
                   Value = day06$Value)
#view(day6)

day6 <- filter(day6, Country=="Korea") 
day6
day6 <- day6[1:10, ]
view(day6)
# Generate the layout. This function return a dataframe with one line per bubble. 
# It gives its center (x and y) and its radius, proportional of the value
packing6 <- circleProgressiveLayout(day6$Value, sizetype='area')
packing6$radius <- 0.95*packing6$radius

# We can add these packing information to the initial data frame
data6 <- cbind(day6, packing6)
view(data6)




# The next step is to go from one center + a radius to the coordinates of a circle that
# is drawn by a multitude of straight lines.
dat.gg6 <- circleLayoutVertices(packing6, npoints=75)

# Make the plot
ggplot() + 
  geom_polygon(data = dat.gg6, aes(x, y, group = id, fill=as.factor(id)), # Make the bubbles
               colour = "white", alpha = 0.9) +
  # Add text in the center of each bubble + control its size
  geom_text(data = data6, aes(x, y, size=Value, label = Time)) + 
  scale_size_continuous(range = c(1,4)) +
  scale_fill_manual(values=c("red", "blue","yellow", "orange","darkgreen", "pink",
                             "magenta","navyblue","green","grey","purple"))+
  theme_void() + # General theme:
  labs(title = "Gradual Minimun Wage increase from 2001 to 2010 in Korea",
       caption = "data:https://data.oecd.org,
       Graphic: Simiani Ndaba")+
  theme(legend.position="none",
        plot.title = element_text(size = 15,hjust = 0.5, face = "bold"),
        plot.caption = element_text(size = 12, hjust=1))+
  coord_equal()
ggsave("2024Day0630DayChartChallenge.png", width = 7, height = 7)
