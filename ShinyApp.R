library(shiny)
library(fpp3)
data(tourism)

ui <- fluidPage(
  mainPanel(plotOutput("Plot")),
  (awesomeRadio(
    inputId = "purpose",
    label = "Which Purpose Would You Like Graphed?", 
    choices = c("Business", "Holiday", "Other", "Visiting"),
    selected = "Business"
  ))
)

server <- function(input, output, session) {
  output$Plot <- renderPlot({
    CV <- filter(tourism, Region == "Clare Valley", Purpose == input$purpose)
    autoplot(CV)
    
  })
  
  
}

shinyApp(ui, server)
