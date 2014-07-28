source('Globals.R')

# Define UI for Quiz application
shinyUI(fluidPage(
  
  titlePanel('Quiz'),

  fluidRow(

    column(8,
           h5('Per answer 2 points can be earned. 
              For each wrong answer 1 point is deducted. 
              Your answers are recorded after you\'ve pushed \'Send\'.'),
           uiOutput("ui")),
           
    # Hidden input boxes to save the variable to 
    HTML(' <input type="text" id="userData" name="userData" value="test, 5" style="display: none;"> '),
    
    # include the js code 
    #includeScript("www/get_user_id.js"),


    column(4, list(h4('Results'),
                   verbatimTextOutput('value'),
                   verbatimTextOutput('result1'),
                   verbatimTextOutput('result2'),
                   verbatimTextOutput('result3'),
                   verbatimTextOutput('result4'),
                   verbatimTextOutput('result5'),
                   verbatimTextOutput('result6'),
                   verbatimTextOutput('scr'),
                   verbatimTextOutput('user'),
                  

                   h6('This quiz uses a database of 15 questions.
                      At each session 3 questions are sampled.
                      The answers are put in random order. 
                      The code of this application is available at:'),
                   a('Github', href='https://github.com/witusj/Quizii.git')   
                  )   
          )
         )
))
    