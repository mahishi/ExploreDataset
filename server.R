library(shiny)
library(datasets)

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {

  # By declaring datasetInput as a reactive expression we ensure that:
  #
  #  1) It is only called when the inputs it depends on changes
  #  2) The computation and result are shared by all the callers (it 
  #     only executes a single time)
  #HairEyeColor
  datasetInput <- reactive({
    switch(input$dataset,
		"ChickWeight" = ChickWeight,
		"InsectSprays" = InsectSprays,
		"airquality" = airquality,
		"volcano" = volcano,
		"iris" = iris,
		"WorldPhones" = WorldPhones,
        "rock" = rock,
        "pressure" = pressure,
        "mtcars" = mtcars)
  })

  # The output$caption is computed based on a reactive expression that
  # returns input$caption. When the user changes the "caption" field:
  #
  #  1) This expression is automatically called to recompute the output 
  #  2) The new caption is pushed back to the browser for re-display
  # 
  # Note that because the data-oriented reactive expressions below don't 
  # depend on input$caption, those expressions are NOT called when 
  # input$caption changes.
  
  
#### Dataset Structure ==============>
  output$str_title <- renderText({
     "Dataset Structure"
  })
  # The output$summary depends on the datasetInput reactive expression, 
  # so will be re-executed whenever datasetInput is invalidated
  # (i.e. whenever the input$dataset changes)
  output$str <- renderPrint({
    dataset <- datasetInput()
    str(dataset)
  })

#### Dataset Structure ==============>
    output$summary_title <- renderText({
     "Dataset Summary"
  })
output$summary <- renderPrint({
    dataset <- datasetInput()
	summary(dataset)
  })
  
  
#### Dataset Class ==============>
   output$class_title <- renderText({
     "Dataset Class"
  })
output$class <- renderPrint({
    dataset <- datasetInput()
    class(dataset)
  })

  
#### Dataset Observations ==============>
output$observation_title <- renderText({
     "Dataset Observations"
  })
  
  # The output$view depends on both the databaseInput reactive expression
  # and input$obs, so will be re-executed whenever input$dataset or 
  # input$obs is changed. 
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  

  
})