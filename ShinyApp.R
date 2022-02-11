library(shiny)
library(fpp3)
data(tourism)

ui <- fluidPage(
  mainPanel(plotOutput("Plot"))
  
)

server <- function(input, output, session) {
  output$Plot <- renderPlot({
    CV <- filter(tourism, Region == "Clare Valley")
    autoplot(CV)
    
  })
  
  
}

shinyApp(ui, server)
