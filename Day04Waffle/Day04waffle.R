library(tidyverse)
library(ggplot2)
library(waffle)
library(png)


cats_uk_reference <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-01-31/cats_uk_reference.csv')

hrs <- unique(cats_uk_reference$hrs_indoors)

cats <- waffle(hrs, rows = 5,  colors = c("blue4", "yellow2", "green", "darkmagenta","orangered"))
cats


catpic = readPNG("cat.png")
grey = readPNG("greyCat.png")
pillow = readPNG("pillow.png")
world = readPNG("world.png")
purple = readPNG("purple.png")


## Make a blank plot
plot(NULL ,main = "2023 UK average number of hours Cats were indoors per day",
     sub="source:2023 Tidy Tuesday Week 05 | Graphic: Simisani Ndaba",
     xaxt='n',yaxt='n',bty='n',ylab='',xlab='', xlim=c(0,15), ylim=c(0,5)) 


# Add 12 hours
rasterImage(catpic,0,0,1,1)
rasterImage(catpic,0,1,1,2)
rasterImage(catpic,0,2,1,3)
rasterImage(catpic,0,3,1,4)
rasterImage(catpic,0,4,1,5)

rasterImage(catpic,1,0,2,1)     
rasterImage(catpic,1,1,2,2)
rasterImage(catpic,1,2,2,3)
rasterImage(catpic,1,3,2,4)
rasterImage(catpic,1,4,2,5)

rasterImage(catpic,2,0,3,1)
rasterImage(catpic,2,1,3,2)


#add 7 hours
rasterImage(grey,2,2,3,3)     
rasterImage(grey,2,3,3,4)
rasterImage(grey,2,4,3,5)
rasterImage(grey,3,0,4,1)
rasterImage(grey,3,1,4,2)

rasterImage(grey,3,2,4,3)
rasterImage(grey,3,3,4,4)


#add 17 hours
rasterImage(pillow,3,4,4,5)
rasterImage(pillow,4,0,5,1)
rasterImage(pillow,4,1,5,2)
rasterImage(pillow,4,2,5,3)
rasterImage(pillow,4,3,5,4)

rasterImage(pillow,4,4,5,5)     
rasterImage(pillow,5,0,6,1)
rasterImage(pillow,5,1,6,2)
rasterImage(pillow,5,2,6,3)
rasterImage(pillow,5,3,6,4)

rasterImage(pillow,5,4,6,5)
rasterImage(pillow,6,0,7,1)
rasterImage(pillow,6,1,7,2)
rasterImage(pillow,6,2,7,3)
rasterImage(pillow,6,3,7,4)

rasterImage(pillow,6,4,7,5)     
rasterImage(pillow,7,0,8,1)


#add 2 hours
rasterImage(world,7,1,8,2)
rasterImage(world,7,2,8,3)


#add 22 hours
rasterImage(purple,7,3,8,4)
rasterImage(purple,7,4,8,5)
rasterImage(purple,8,0,9,1)
rasterImage(purple,8,1,9,2)
rasterImage(purple,8,2,9,3)

rasterImage(purple,8,3,9,4)     
rasterImage(purple,8,4,9,5)
rasterImage(purple,9,0,10,1)
rasterImage(purple,9,1,10,2)
rasterImage(purple,9,2,10,3)

rasterImage(purple,9,3,10,4)
rasterImage(purple,9,4,10,5)
rasterImage(purple,10,0,11,1)
rasterImage(purple,10,1,11,2)
rasterImage(purple,10,2,11,3)

rasterImage(purple,10,3,11,4)
rasterImage(purple,10,4,11,5)
rasterImage(purple,11,0,12,1)
rasterImage(purple,11,1,12,2)
rasterImage(purple,11,2,12,3)

rasterImage(purple,11,3,12,4)
rasterImage(purple,11,4,12,5)

#annotation
text(15,4.5,"12.5")
rasterImage(catpic,13,4,14,5)

text(15,3.4,"7.5")
rasterImage(grey,13,3,14,4)

text(15,2.5,"17")
rasterImage(pillow,13,2,14,3)

text(15,1.5,"2")
rasterImage(world,13,1,14,2)

text(15,0.5,"22")
rasterImage(purple,13,0,14,1)


