library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Explore Datasets - Shiny Reactive Application"),

  # Sidebar with controls to provide a caption, select a dataset, and 
  # specify the number of observations to view. Note that changes made
  # to the caption in the textInput control are updated in the output
  # area immediately as you type
  sidebarPanel(
    # textInput("caption", "Caption:", "Data Summary"),

    selectInput("dataset", "Choose a dataset:", 
                choices = c("rock", "pressure", "mtcars", "ChickWeight", "InsectSprays", "airquality", "volcano", "iris", "WorldPhones")),

    numericInput("obs", "Number of observations to view:", 10)
  ),


  # Show the caption, a summary of the dataset and an HTML table with
  # the requested number of observations
  mainPanel(
  p("This application helps you explore standard datasets available in R datasets package. It takes two inputs."),
  p("1. Drop down selection of dataset. Default: rock dataset"),
  p("2. Number of dataset observations that you want to see. (Default: 10 Observations)"),
  
  p("Once dataset is selected, application displays its structure, summary, class and the first set of 10 observations. You can change the Number of observations input to display as many observations of the dataset as you want."),
  h4(textOutput("str_title")), 

  verbatimTextOutput("str"), 
  
  h4(textOutput("summary_title")), 

  verbatimTextOutput("summary"), 

  h4(textOutput("class_title")),
	
  verbatimTextOutput("class"),
	
  h4(textOutput("observation_title")), 
	
  tableOutput("view")
	
  )
))