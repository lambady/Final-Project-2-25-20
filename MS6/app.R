
library(shiny)

# Define UI for application that draws a histogram
ui <- navbarPage(
    "Organ Donation Registration in New York",
    tabPanel("Model",
             fluidPage(
                 titlePanel("Model Title"),
                 sidebarLayout(
                     sidebarPanel(
                         selectInput(
                             "plot_type",
                             "Plot Type",
                             c("Proportion of Population that is White" = "a", 
                               "Proportion of Population that is Black" = "b",
                               "Proportion of Population that is Asian" = "c")
                         )),
                     mainPanel(plotOutput("Image")))
             )),
    tabPanel("Discussion",
             titlePanel("Discussion Title"),
             p("Tour of the modeling choices you made and 
              an explanation of why you made them")),
    tabPanel("About", 
             titlePanel("About"),
             h3("Project Background and Motivations"),
             p("With increasing rates of disease in the kidney, lung, and liver, post-mortem donation has become an important way to 
               save lives. This project analyzes rates of organ donation registration in the counties of New York state, attempting to 
               see what factors might facilitate registration, and what factors might pose a barrier to registration. So far, it looks as 
               though minorities are uncomfortable registering as organ donors, and I will look at other data to see why this might be."),
             h3("About Me"),
             p("My name is Leena Ambady and I study the history of science. 
             You can reach me at lambady@college.harvard.edu.")),
    tabPanel("Test", 
             titlePanel("This is a test Title"),
             h3("Heading 1"),
             p("This is where I write a whole paragraph"),
             h3("Heading 2"),
             p("This is where I write another whole paragraph")
    ))

# Define server logic required to draw a histogram
server <- function(input, output) {
    output$Image <- renderImage({
        
        # needed to load this library or an error comes up in shiny
        
        library(dplyr)
        
        # This has my three graphs 
        
        file <- case_when(input$plot_type == "a" ~ file.path("prop_white.png"),
        
        input$plot_type == "b" ~ file.path("prop_black.png"),
        
        input$plot_type == "c" ~ file.path("prop_asian.png"))
        
        # Made the source "file" and set the height and width so they were in a
        # nice proportion. Follow instructions online, which said to include
        # deleteFile as well.
        
        list(src = file,
             contentType = 'image/png',
             width = 800,
             height = 550,
             alt = "This is alternate text")
        
    }, deleteFile = FALSE)
}

# Run the application 
shinyApp(ui = ui, server = server)
