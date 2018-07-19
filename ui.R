library(shiny)

shinyUI(
  navbarPage("Shiny App for Airquality Dataset",
             tabPanel("Analysis and Plot",
                      fluidPage(
                        titlePanel("Simple Linear Relationship between Ozone and other variables"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Solar R (lang)" = "Solar.R",
                                          "Wind (mph)" = "Wind",
                                          "Temperature (degrees F)" = "Temp")),
                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                          ),
                          
                          mainPanel(
                          h3(textOutput("caption")),
                          
                          tabsetPanel(type = "tabs",
                                      tabPanel("BoxPlot", plotOutput("OzoneBoxPlot")),
                                      tabPanel("Simple Regression Model",
                                               plotOutput("OzonePlot"),
                                               verbatimTextOutput("fit")
                                               )
                                      )
                          )
                        )
                        )
                      ),
             tabPanel("My Github Repository",
                      a("https://github.com/tongmanhok/Peer-graded-Assignment-Course-Project-Shiny-Application-and-Reproducible-Pitch"),
                      hr(),
                      h2("Thank you!")
                      )
             )
            )
