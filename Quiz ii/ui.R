source('C:/Users/NB/Google Drive/Data Analysis/Shinies/Quiz ii/Globals.R')

# Define UI for Quiz application
shinyUI(bootstrapPage(
  
  uiOutput("ui"),
  
  verbatimTextOutput('result1'),
  verbatimTextOutput('result2'),
  verbatimTextOutput('result3'),
  verbatimTextOutput('scr')
))

  