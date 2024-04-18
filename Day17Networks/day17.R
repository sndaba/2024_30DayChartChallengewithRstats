library(tidyverse)
library(igraph)
library(ggraph)
library(colormap)
library(ggpubr)
library(jpeg)
library(png)
library(grid)

library(sysfonts)
library(showtextdb)
library(showtext)   # font texts
library(extrafont)
library(ggtext)

font_add(family = "gemerald", "Gemerald-rx8B.ttf")
showtext_auto()

population <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-08-22/population.csv')
View(population)


new_pop <- population %>% select('coo_name', 'coa_name')
View(new_pop)
subset_new_pop <- head(new_pop, 60)

# Transform to a igraph object
mygraph <- graph_from_data_frame(subset_new_pop)


img <- readPNG("refugeeMigration.png")

p1 <-  ggraph(mygraph) + background_image(img) +
  geom_edge_link(edge_colour="black", edge_alpha=0.3, edge_width=0.2) +
  geom_node_point( color="navyblue", size=5) +
  geom_node_text( aes(label=name), repel = TRUE, size=8, color="navyblue") +
  theme_void() +
  labs(title = "African and Eastern Refugee Migration from 2010 to 2022 \n\n\n\n\n",
       caption ="source: population dataset from the refugee R package | Graphic: SNdaba")+
  theme(
    plot.title = element_markdown(family = "gemerald", hjust = 0.5, size = 35),
    plot.background = element_rect(colour = "white"),
    plot.caption = element_text(family = "gemerald", hjust = 0.5, size = 15),
    legend.position="none",
    plot.margin=unit(rep(2,4), "cm"))
p1 
  
ggsave("day17.png", width=8,height=5)
