# Load necessary libraries
library(ggplot2)
library(extrafontdb)
library(extrafont)
library(showtextdb)
library(showtext)
library(sysfonts)
library(gridExtra)
library(ggforce)
library(ggfx)

font_add(family = "college", "CollegeBlock20-K5ql.ttf")
showtext_auto()

pres <- read_csv("beer-consumption-per-person.csv")
view(pres)

# redefine the dataset
data <- data.frame(
  Country = rep("Botswana", 59),
  Code = rep("BWA", 59),
  Year = seq(1961, 2019),
  Value = c(3.05, 2.91, 3.17, 3.03, 3.23, 3.48, 3.4, 3.18, 3.32, 3.34,
            3.36, 3.87, 3.98, 2.55, 2.85, 2.54, 2.25, 1.28, 1.36, 1.51,
            1.54, 1.48, 1.58, 1.77, 2.29, 2.25, 2.22, 2.06, 2.35, 2.02,
            2.03, 2.99, 3.12, 2.19, 2.1, 2.1, 2.03, 2.12, 2.01, 2.30919,
            2.70781, 2.6215, 2.50532, 2.47809, 2.58297, 2.65414, 2.64552,
            2.17467, 2.28086, 2.48, 2.39, 2.39, 2.79, 3.15, 3.33, 3.34,
            2.93, 2.93, 2.93)
)

# Add a line at 1966 to indicate independence day
independence_line <- geom_vline(xintercept = 1966,linewidth =1.5, 
                                linetype = "dotdash", color = "maroon")


img <- readPNG("PngItem_1121235.png")
img_width <- dim(img)[2]
img_height <- dim(img)[1]

# Define the desired width and height for the resized image
desired_width <- 0.5  # Set the desired width of the image
desired_height <- 0.5  # Set the desired height of the image

# Calculate the scaling factors
scale_factor_width <- desired_width / img_width
scale_factor_height <- desired_height / img_height

# Resize the image
resized_img <- rasterGrob(img, width = unit(scale_factor_width, "npc"), height = unit(scale_factor_height, "npc"))




#Create the stacked area chart
plot <- ggplot(data, aes(x = Year, y = Value, fill = Country)) +
  geom_area(color = "black") +
  scale_fill_manual(values = c("seagreen1"))+
  ylim(0,4.5)+
  independence_line +
  labs(title = "Pure alcohol consumption, litres per capita, age +15\nin Botswana",
       caption = "source: WHO indicator | graphic: Simisani Ndaba",
       x = " ",
       y = "litres",
       fill = "Country") +
  theme_minimal()+
  theme(plot.title = element_text(family="college",hjust = 0.5, size = 32),
        plot.caption = element_text(hjust = 1, size = 18),
        legend.position = "none",
        axis.text=element_text(size=25),
        axis.title=element_text(size=25),
        plot.background = element_rect(fill = 'snow2'))


#curve line for annotation
plot + geom_curve(
  aes(x = 1980, y = 4, xend = 1966.5, yend = 4.2),
  arrow = arrow(length = unit(0.3, "inch")), size = 1.5,
  color = "olivedrab4", curvature = 0.5 # 0 = straight line, negative = left-hand curves, positive = right-hand curves
) + annotate(geom="text", label="Independence Year", size=8,colour="black", x=1982,y=3.9, angle = 350)+
  annotation_custom(resized_img, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf)

ggsave("2024Day03_30daychartchallenge.png", width = 4, height = 4)
