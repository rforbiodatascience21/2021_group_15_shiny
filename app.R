library(shiny)
library(shinythemes)
library(tidyverse)

source("random_dna.R")
source("mk_codons.R")
source("dna_codons_to_aa.R")
source("complement.R")
source("check_if_dna.R")

ui <- fluidPage(theme = shinytheme("superhero"),
                
                navbarPage(
                  "Group 15",
                  
                  # display DNA string
                  tabPanel(
                    "Get DNA sequence",
                    titlePanel("Input a DNA sequence or sample a random sequence"),
                    
                    sidebarLayout(
                      position = "left",
                      
                      sidebarPanel(
                        textInput(
                          inputId = "text",
                          label = "Choose to either input a DNA sequence"
                        ),
                        
                        numericInput(
                           inputId = "number",
                           label = "or sample a DNA sequence of chosen length",
                           value = "0"
                         ),
                        
                        radioButtons(
                          inputId = "complementary",
                          label = "Do you want the complementary DNA string?",
                          c("No" = "no",
                            "Yes" = "yes")
                        ),
                        
                        actionButton(
                          inputId = "sequence_button", 
                          label = "Get DNA sequence")
                      ),
                      
                      mainPanel(textOutput("random_dna"))
                    )
                  ),
                  
                  # display codons
                  tabPanel(
                    "Get codons",
                    titlePanel("Turn your DNA string into codons"),
                    
                    sidebarLayout(
                      position = "left",
                      
                      sidebarPanel(
                        radioButtons(
                          inputId = "reading_frame",
                          label = "Select which reading frame you want",
                          c("#1" = "1",
                            "#2" = "2",
                            "#3" = "3")
                        ),
                        
                        actionButton("codon_button", "Get codons")),
                      
                      mainPanel(textOutput("Codons"))
                    )
                  ),
                  
                  # display amino acids
                  tabPanel(
                    "Get amino acids",
                    titlePanel("Which amino acids do the codons translate to?"),
                    
                    sidebarLayout(
                      position = "left",
                      
                      sidebarPanel(
                        radioButtons(
                          inputId = "letters",
                          label = "Specify how you want the amino acid output",
                          c(
                            "One letter code" = "one",
                            "Three letter code" = "three",
                            "Full name of amino acids" = "all"
                          )
                        ),
                        
                        actionButton("amino_button", "Get amino acids")
                      ),
                      
                      mainPanel(textOutput("amino"))
                    )
                  )
                ))

server <- function(input, output, session) {
  
  # save reactive values
  dna <- reactiveValues()
  observe({
    dna$random <- random_dna(input$number)
    dna$string <- str_to_upper(input$text)
  })
  
  # display DNA sequence
  get_sequence <- eventReactive(input$sequence_button, {
    if (input$text == "") {
      compl <- switch(input$complementary,
                      yes = complement(dna$random),
                      no = dna$random)
    }
    else if (check_if_dna(input$text)) {
      string <- str_to_upper(input$text)
      compl <- switch(input$complementary,
                      yes = complement(string),
                      no = string)
    }
    else {
      print("The input is not a DNA sequence")
    }
  })

  # display codons
  codons <- eventReactive(input$codon_button, {
    if (input$text == "") {
      switch(input$reading_frame,
             "1" = mk_codons(dna$random, s = 1),
             "2" = mk_codons(dna$random, s = 2),
             "3" = mk_codons(dna$random, s = 3))
    }
    else {
      switch(input$reading_frame,
             "1" = mk_codons(dna$string, s = 1),
             "2" = mk_codons(dna$string, s = 2),
             "3" = mk_codons(dna$string, s = 3))
    }
  })
  
  # display amino acids
  amino_acids <- eventReactive(input$amino_button, {
    codons <- codons() 
    switch(input$letters,
           "one" = dna_codons_to_aa_one_letter(codons),
           "three" = dna_codons_to_aa_three_letter(codons),
           "all" = dna_codons_to_aa_full(codons))
  })
  
  # outputs
  output$random_dna <- renderText({get_sequence()})
  output$Codons <- renderText({codons()})
  output$amino <- renderText({amino_acids()})
}

shinyApp(ui = ui, server = server)
