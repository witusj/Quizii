source('Globals.R')

# Define UI for Quiz application
shinyUI(fluidPage(
  
  titlePanel('Quiz'),

  fluidRow(

    column(8,
           h5('Per vraag kunnen 2 punten worden verdiend. Voor ieder fout 
               antwoord wordt het aantal te verdienen punten verminderd met 1 punt. 
              De antwoorden worden geregistreerd nadat op \'Verzenden\' is gedrukt.'),
           uiOutput("ui")),
           
    # Hidden input boxes to save the variable to 
    HTML(' <input type="text" id="userData" name="userData" value="test, 5" style="display: none;"> '),
    
    # include the js code 
    includeScript("www/get_user_id.js"),


    column(4, list(h4('Resultaten'),
                   verbatimTextOutput('value'),
                   verbatimTextOutput('result1'),
                   verbatimTextOutput('result2'),
                   verbatimTextOutput('result3'),
                   verbatimTextOutput('result4'),
                   verbatimTextOutput('result5'),
                   verbatimTextOutput('result6'),
                   verbatimTextOutput('scr'),
                   verbatimTextOutput('user')
                              
                  )   
          )
         )
))
    