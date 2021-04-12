library(shiny)
library(shinythemes)

source("random_dna.R")
source("mk_codons.R")
source("dna_codons_to_aa.R")
source("complement.R")

ui <- fluidPage(theme = shinytheme("superhero"),
                
                navbarPage(
                  "Group 15",
                  tabPanel(
                    "Create DNA string",
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
                  ),
                  tabPanel(
                    "Create codons",
                    titlePanel("Turn your DNA string into codons"),
                    
                    sidebarLayout(
                      position = "left",
                      
                      sidebarPanel(actionButton("button", "Make codons")),
                      
                      mainPanel(textOutput("Codons"))
                    )
                  ),
                  tabPanel(
                    "Get amino acids",
                    titlePanel("Get amino acids from codons"),
                    
                    sidebarLayout(
                      position = "left",
                      
                      sidebarPanel(actionButton("button2", "Get amino acids")),
                      
                      mainPanel(textOutput("AAs"))
                    )
                  )
                ))

server <- function(input, output, session) {
  output$random_dna <- renderText(random_dna(input$number))

  codons <- eventReactive(input$button, {mk_codons(random_dna(input$number))})
  
  output$Codons <- renderText({codons()})
  
  amino_acids <- eventReactive(input$button2, {dna_codons_to_aa(mk_codons(random_dna(input$number)))})
  
  output$AAs <- renderText({amino_acids()})
}

shinyApp(ui = ui, server = server)
