library(shiny)
library(shinythemes)

source("random_dna.R")

ui <- fluidPage(
  theme = shinytheme("superhero"),
  
  titlePanel("This is a shiny app"),
  
  sidebarLayout(
    position = "left",
    
    sidebarPanel(
      numericInput(
        inputId = "number",
        label = "Choose a DNA string length",
        value = "0"
      )
    ),
  
  mainPanel(textOutput("random_dna"))
  )
)

server <- function(input, output, session) {
  output$random_dna <- renderText({random_dna(input$number)})
}

shinyApp(ui = ui, server = server)
