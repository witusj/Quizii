source('Globals.R')

# Define UI for Quiz application
shinyUI(fluidPage(
  
  titlePanel('This is a test'),
  
  fluidRow(
    
    column(8,
           h5('Per answer 2 points can be earned. 
              For each wrong answer 1 point is deducted. 
              Your answers are recorded after you\'ve pushed \'Send\'.'),
           uiOutput("ui")),
    
    column(4, list(verbatimTextOutput('result1'),
                   verbatimTextOutput('result2'),
                   verbatimTextOutput('result3'),
                   verbatimTextOutput('scr'),
                   h6('This test uses a database of 15 questions.
                      At each session 3 questions are sampled.
                      The answers are then resampled and put in random order. 
                      The code of this application is available at'),
                      a('Github', href='https://github.com/witusj/Quizii.git')
           
              )   
          )
))
)
  