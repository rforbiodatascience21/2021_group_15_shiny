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
                    titlePanel("Input a DNA sequence or sample a random sequence"),
                    
                    sidebarLayout(
                      position = "left",
                      
                      
                      sidebarPanel(
                        textInput(
                          inputId = "text",
                          label = "Input a DNA sequence"
                        ),
                        
                        numericInput(
                          inputId = "number",
                          label = "Choose a DNA string length",
                          value = "0"
                        ),
                        radioButtons(
                          "radio",
                          "Complementary?",
                          c("No" = "no",
                            "Yes" = "yes")
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
  #observeEvent(random_dna(input$number))
  
  #dna <- eventReactive(random_dna(input$number))
  
  dna <- reactiveValues()
  observe({
    dna$test <- random_dna(input$number)
  })
  
  output$random_dna <- renderText({
    compl <- switch(input$radio,
                    yes = complement(dna$test),
                    no = dna$test)})

  codons <- eventReactive(input$button, {mk_codons(dna$test)})
  
  output$Codons <- renderText({codons()})
  
  amino_acids <- eventReactive(input$button2, {dna_codons_to_aa(mk_codons(dna$test))})
  
  output$AAs <- renderText({amino_acids()})
}

shinyApp(ui = ui, server = server)
