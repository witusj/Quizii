#Load all necessary supporting files
library(shiny)
library(plyr)
source('Globals.R')
source('Setup.R')

#Set up server
shinyServer(function(input, output) {
  
  ##Sample 3 questions from database and for each question randomly choose
  ##order of answers. Save correct answers in reactive value variables.
  n <- sample(c(1:length(questions$Vraag)), size =3)
  m <- sample(c(4:7), size =4, replace=FALSE)
  s <- sample(c(4:7), size =4, replace=FALSE)
  p <- sample(c(4:7), size =4, replace=FALSE)
  
  vraag <<- questions[n,]
  
  values <- reactiveValues()
  values[['corr1']] <- vraag$Antwoord[1]
  values[['corr2']] <- vraag$Antwoord[2]
  values[['corr3']] <- vraag$Antwoord[3]
  
  #Build user interface with 1 radio button per question. Save choices
  #in reactive variables. Set initial choice to zero (no choice)
  output$ui <- renderUI({fluidPage(
        
    radioButtons('answ1', paste('Q1 -',vraag$Vraag[1]),
                 c(vraag[1,m[1]],
                   vraag[1,m[2]],
                   vraag[1,m[3]],
                   vraag[1,m[4]]), selected = 0),
    
    radioButtons('answ2', paste('Q2 -',vraag$Vraag[2]),
                 c(vraag[2,s[1]],
                   vraag[2,s[2]],
                   vraag[2,s[3]],
                   vraag[2,s[4]]), selected = 0),
    
    radioButtons('answ3', paste('Q3 -',vraag$Vraag[3]),
                 c(vraag[3,p[1]],
                   vraag[3,p[2]],
                   vraag[3,p[3]],
                   vraag[3,p[4]]), selected = 0),
    
    actionButton('goButton', 'Send')
  )
    })
  
  #Build server output
  
  ##Check questions and put results (Correct/False) in reactive variable.
  ##Initial choice (no choice) is neutral and equals 'Choose'
  rltInput1 <- reactive({input$goButton
                         isolate(try_default(chkQuestion(input$answ1, values$corr1,1),
                                     default = 'Choose', quiet = TRUE))
                        })
  rltInput2 <- reactive({input$goButton
                         isolate(try_default(chkQuestion(input$answ2, values$corr2,2),
                                             default = 'Choose', quiet = TRUE))
                        })
  rltInput3 <- reactive({input$goButton
                         isolate(try_default(chkQuestion(input$answ3, values$corr3,3),
                                             default = 'Choose', quiet = TRUE))
                        })
    
  ##Print results
  output$result1 <- renderText({paste('Q1:',rltInput1())})
  output$result2 <- renderText({paste('Q2:',rltInput2())})
  output$result3 <- renderText({paste('Q3:',rltInput3())})
  
  ##Calculate points left per question
  scrInput1 <- reactive({scrQuestion1(rltInput1())})
  scrInput2 <- reactive({scrQuestion2(rltInput2())})
  scrInput3 <- reactive({scrQuestion3(rltInput3())})
  
  ##Calculate total points left and print result
  output$scr <- renderText({paste0('Your score is: ',scrInput1() + scrInput2() + scrInput3(),
                                   ' (which equals ', round((scrInput1() + scrInput2() + scrInput3())*100/6,0),
                                   '%)')})

  userData <- reactive({input$goButton
                         strsplit(isolate(input$userData),',')
                        })
  output$view <- renderText(paste0("User name: ",userData()[[1]][1],", User ID: ",userData()[[1]][2]))

  })

  