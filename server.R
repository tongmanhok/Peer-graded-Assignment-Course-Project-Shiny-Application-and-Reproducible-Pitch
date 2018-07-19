library(shiny)
library(datasets)

data <- airquality

shinyServer(function(input, output){
  
  model <- reactive({
    paste("Ozone ~ ", input$variable)
  })
  
  modeltext <- reactive({
    paste("Ozone ~ ", "as.integer(", input$variable, ")")
  })
  
  fit <- reactive({
    lm(as.formula(modeltext()), data = data)
  })
  
  output$cation <- renderText({
    model()
  })
  
  output$OzoneBoxPlot <- renderPlot({
    boxplot(as.formula(modeltext()),
            data = data,
            outline = input$outliers)
  })
  
  output$fit <- renderPrint({
    summary(fit)
  })
  
  output$OzonePlot <- renderPlot({
    with(data, {
      plot(as.formula(modeltext()))
           abline(fit(), col = 2)
           })
    })
  
})