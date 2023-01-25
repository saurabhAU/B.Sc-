

# Define server logic required to draw a histogram
library(tidyverse)
library(gapminder)
gapminder %>% 
  filter(year == 2007) %>% 
  ggplot(aes(y = lifeExp, x = continent)) +
  geom_jitter(aes(size = pop/1000000, fill = lifeExp),
              shape = 21, colour = "grey", alpha = 0.8, width = 0.15) +
  scale_fill_distiller(palette = "Paired") +
  coord_cartesian(ylim = c(30,85)) +
  scale_size("Population, millions", range = c(5, 25), breaks = c(10, 50, 100, 250, 1000)) +
  theme_bw() +
  labs(caption = "Each bubble is a country.", ylab = "Life expectancy")  +
  theme(aspect.ratio=0.6)


library(shiny)
library(tidyverse)
library(gapminder)
# User Interface
ui <- basicPage(
  plotOutput(outputId = "myplot")
)
# Server
server <- function(input, output) {
  output$myplot <- renderPlot({
    #your plot code here:
  })  
}
shinyApp(ui, server)

