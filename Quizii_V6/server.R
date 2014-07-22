#Load all necessary supporting files
library(shiny)
library(plyr)
source('Globals.R')
source('Setup.R')

#Set up server
shinyServer(function(input, output, session) {
  
  ##Sample n MC questions from database and for each MC question randomly choose
  ##order of answers. Save correct answers in reactive value variables.
  n <- sample(c(1:length(questionsMC$Vraag)), size =3)
  a <- sample(c(6:9), size =4, replace=FALSE)
  b <- sample(c(6:9), size =4, replace=FALSE)
  d <- sample(c(6:9), size =4, replace=FALSE)
  
  vraagMC <<- questionsMC[n,]
  vraagOpen <<- questionsOpen[1,]
  
  values <- reactiveValues()
  values[['corr1']] <- vraagMC$Antwoord[1]
  values[['corr2']] <- vraagMC$Antwoord[2]
  values[['corr3']] <- vraagMC$Antwoord[3]
  values[['corr4']] <- vraagOpen$Antwoord[1]
  
  ##Build user interface with 5 MC and 5 open questions. Save choices
  ##in reactive variables. Set initial choice to zero (no choice)
  output$ui <- renderUI({fluidPage(
        
    radioButtons('answ1', paste('Q1 -',vraagMC$Vraag[1]),
                 c(vraagMC[1,a[1]],
                   vraagMC[1,a[2]],
                   vraagMC[1,a[3]],
                   vraagMC[1,a[4]]), selected = 0),
    
    radioButtons('answ2', paste('Q2 -',vraagMC$Vraag[2]),
                 c(vraagMC[2,b[1]],
                   vraagMC[2,b[2]],
                   vraagMC[2,b[3]],
                   vraagMC[2,b[4]]), selected = 0),
    
    radioButtons('answ3', paste('Q3 -',vraagMC$Vraag[3]),
                 c(vraagMC[3,d[1]],
                   vraagMC[3,d[2]],
                   vraagMC[3,d[3]],
                   vraagMC[3,d[4]]), selected = 0),
    
    textInput('answ4', vraagOpen$Vraag[1], value = ''),
    
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
  
  rltInput4 <- reactive({input$goButton 
                         isolate(try_default(chkQuestionOpen(input$answ4, values$corr4),
                                             default = 'Leeg', quiet = TRUE))
  })
  
  ##Print results
  output$result1 <- renderText({paste('V1:',rltInput1())})
  output$result2 <- renderText({paste('V2:',rltInput2())})
  output$result3 <- renderText({paste('V3:',rltInput3())})
  output$result4 <- renderText({paste('V4:',rltInput4())})
  
  ##Calculate points left per MC question and only add them when answer is correct
  scrInput1 <- reactive({scrQuestion(rltInput1(),1)*(rltInput1()=='Correct')})
  scrInput2 <- reactive({scrQuestion(rltInput2(),2)*(rltInput2()=='Correct')})
  scrInput3 <- reactive({scrQuestion(rltInput3(),3)*(rltInput3()=='Correct')})
  scrInput4 <- reactive({scrQuestion(rltInput4(),4)*(rltInput4()=='Correct')})
  
  ##Calculate total points left and print result
  output$scr <- renderText({paste0('Your score is: ',scrInput1() + scrInput2() + scrInput3() + scrInput4(),
                                   ' (which equals ', round((scrInput1() + scrInput2() + scrInput3() + scrInput4())*100/8,0),
                                   '%)')})

  ##Prepare user data and print
  userData <- reactive({input$goButton
                         strsplit(isolate(input$userData),',')
                        })
  output$user <- renderText(paste0("User name: ",userData()[[1]][1],", User ID: ",userData()[[1]][2]))
  
  ##Assess number of trials and print
  trials <- reactive({input$goButton})
  output$value <- renderText(paste0('Trials: ', trials()))
  
  urlText <- renderText({
    paste(sep = "",
          session$clientData$url_protocol, "\\",
          session$clientData$url_hostname, "\\",
          session$clientData$url_port,":",
          session$clientData$url_pathname
    )
  })
  
  ##Check whether number of trials variable is empty and if not save data to csv
  observe({if(length(trials()) != 0) {
          quiz <- data.frame(Sys.time(), urlText(), session$clientData$url_search,
                             userData()[[1]][1], userData()[[1]][2], trials(), scrInput1(), scrInput2(), scrInput3(), scrInput4())
          write.table(quiz, file='results.csv', append=TRUE, sep=",", row.names=FALSE,
                      col.names=FALSE)
          }
          })
  })

  