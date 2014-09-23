#Load all necessary supporting files
library(shiny)
library(plyr)

source('Setup.R')

#Set up server
shinyServer(function(input, output, session) {
  source('Globals.R')    
  ##Sample n MC from database. For each MC question randomly choose
  ##order of answers. Save correct answers in reactive value variables.
  print(length(questionsMC$txt))
  n <- sample(1:length(questionsMC$txt), size =6)
  a <- sample(c(2:5), size =4, replace=FALSE)
  b <- sample(c(2:5), size =4, replace=FALSE)
  d <- sample(c(2:5), size =4, replace=FALSE)
  e <- sample(c(2:5), size =4, replace=FALSE)
  f <- sample(c(2:5), size =4, replace=FALSE)
  g <- sample(c(2:5), size =4, replace=FALSE)
  h <- sample(c(2:5), size =4, replace=FALSE)
  i <- sample(c(2:5), size =4, replace=FALSE)
  j <- sample(c(2:5), size =4, replace=FALSE)
  k <- sample(c(2:5), size =4, replace=FALSE)
  
  vraagMC <<- questionsMC[n,]
  print(vraagMC$txt[5])
  print(vraagMC$corr[5])
  
  values <- reactiveValues()
  values[['corr1']] <- vraagMC$corr[1]
  values[['corr2']] <- vraagMC$corr[2]
  values[['corr3']] <- vraagMC$corr[3]
  values[['corr4']] <- vraagMC$corr[4]
  values[['corr5']] <- vraagMC$corr[5]
  values[['corr6']] <- vraagMC$corr[6]
#   values[['corr7']] <- vraagMC$corr[7]
#   values[['corr8']] <- vraagMC$corr[8]
#   values[['corr9']] <- vraagMC$corr[9]
#   values[['corr10']] <- vraagMC$corr[10]
  
  ##Build user interface with 6 MC. Save choices
  ##in reactive variables. Set initial choice of radio buttons to zero (no choice)
  output$ui1 <- renderUI({fluidPage(withMathJax(
    
        
    radioButtons('answ1', paste('V1:',vraagMC$txt[1]),
                 c(vraagMC[1,a[1]],
                   vraagMC[1,a[2]],
                   vraagMC[1,a[3]],
                   vraagMC[1,a[4]]), selected = 0),
    
    radioButtons('answ2', paste('V2:',vraagMC$txt[2]),
                 c(vraagMC[2,b[1]],
                   vraagMC[2,b[2]],
                   vraagMC[2,b[3]],
                   vraagMC[2,b[4]]), selected = 0),
    
    radioButtons('answ3', paste('V3:',vraagMC$txt[3]),
                 c(vraagMC[3,d[1]],
                   vraagMC[3,d[2]],
                   vraagMC[3,d[3]],
                   vraagMC[3,d[4]]), selected = 0)
    
#     radioButtons('answ4', paste('V4:',vraagMC$txt[4]),
#                  c(vraagMC[4,e[1]],
#                    vraagMC[4,e[2]],
#                    vraagMC[4,e[3]],
#                    vraagMC[4,e[4]]), selected = 0),
#     
#     radioButtons('answ5', paste('V5:',vraagMC$txt[5]),
#                  c(vraagMC[5,f[1]],
#                    vraagMC[5,f[2]],
#                    vraagMC[5,f[3]],
#                    vraagMC[5,f[4]]), selected = 0) 
  ))
    })
  
  output$ui2 <- renderUI({fluidPage(withMathJax(
    
    radioButtons('answ4', paste('V4:',vraagMC$txt[4]),
                 c(vraagMC[4,g[1]],
                   vraagMC[4,g[2]],
                   vraagMC[4,g[3]],
                   vraagMC[4,g[4]]), selected = 0),
    
    radioButtons('answ5', paste('V5:',vraagMC$txt[5]),
                 c(vraagMC[5,h[1]],
                   vraagMC[5,h[2]],
                   vraagMC[5,h[3]],
                   vraagMC[5,h[4]]), selected = 0),
    
    radioButtons('answ6', paste('V6:',vraagMC$txt[6]),
                 c(vraagMC[6,i[1]],
                   vraagMC[6,i[2]],
                   vraagMC[6,i[3]],
                   vraagMC[6,i[4]]), selected = 0),
    
#     radioButtons('answ9', paste('V9:',vraagMC$txt[9]),
#                  c(vraagMC[9,j[1]],
#                    vraagMC[9,j[2]],
#                    vraagMC[9,j[3]],
#                    vraagMC[9,j[4]]), selected = 0),
#     
#     radioButtons('answ10', paste('V10:',vraagMC$txt[10]),
#                  c(vraagMC[10,k[1]],
#                    vraagMC[10,k[2]],
#                    vraagMC[10,k[3]],
#                    vraagMC[10,k[4]]), selected = 0),
    
    actionButton('goButton', 'Verzenden')
  ))
  })
  
  #Build server output
  
  ##Check questions and put results (Correct/False) in reactive variable.
  ##Initial choice (no choice) is neutral and equals 'Choose'
  rltInput1 <- reactive({input$goButton
                         isolate(try_default(chkQuestion(input$answ1, values$corr1,1),
                                     default = 'Leeg', quiet = TRUE))
                         })
  rltInput2 <- reactive({input$goButton
                         isolate(try_default(chkQuestion(input$answ2, values$corr2,2),
                                             default = 'Leeg', quiet = TRUE))
                         })
  rltInput3 <- reactive({input$goButton
                         isolate(try_default(chkQuestion(input$answ3, values$corr3,3),
                                             default = 'Leeg', quiet = TRUE))
                         })
  
  rltInput4 <- reactive({input$goButton 
                         isolate(try_default(chkQuestion(input$answ4, values$corr4,4),
                                             default = 'Leeg', quiet = TRUE))
                         })
                         
  rltInput5 <- reactive({input$goButton 
                         isolate(try_default(chkQuestion(input$answ5, values$corr5,5),
                                            default = 'Leeg', quiet = TRUE))
                         }) 
                         
  rltInput6 <- reactive({input$goButton 
                         isolate(try_default(chkQuestion(input$answ6, values$corr6,6),
                                            default = 'Leeg', quiet = TRUE))
                         })
#   
#   rltInput7 <- reactive({input$goButton 
#                        isolate(try_default(chkQuestion(input$answ7, values$corr7),
#                                            default = 'Leeg', quiet = TRUE))
#                          })
# 
#   rltInput8 <- reactive({input$goButton 
#                        isolate(try_default(chkQuestion(input$answ8, values$corr8),
#                                            default = 'Leeg', quiet = TRUE))
#                          })
# 
#   rltInput9 <- reactive({input$goButton 
#                        isolate(try_default(chkQuestion(input$answ9, values$corr9),
#                                            default = 'Leeg', quiet = TRUE))
#                          })
# 
#   rltInput10 <- reactive({input$goButton 
#                        isolate(try_default(chkQuestion(input$answ10, values$corr10),
#                                            default = 'Leeg', quiet = TRUE))
#                          })


  ##Print results
  output$result1 <- renderText({paste('V1:',rltInput1())})
  output$result2 <- renderText({paste('V2:',rltInput2())})
  output$result3 <- renderText({paste('V3:',rltInput3())})
  output$result4 <- renderText({paste('V4:',rltInput4())})
  output$result5 <- renderText({paste('V5:',rltInput5())})
  output$result6 <- renderText({paste('V6:',rltInput6())})
#   output$result7 <- renderText({paste('V7:',rltInput7())})
#   output$result8 <- renderText({paste('V8:',rltInput8())})
#   output$result9 <- renderText({paste('V9:',rltInput9())})
#   output$result10 <- renderText({paste('V10:',rltInput10())})
  
  ##Calculate points left per MC question and only add them when answer is correct
  scrInput1 <- reactive({scrQuestion(rltInput1(),1)*(rltInput1()=='Correct')})
  scrInput2 <- reactive({scrQuestion(rltInput2(),2)*(rltInput2()=='Correct')})
  scrInput3 <- reactive({scrQuestion(rltInput3(),3)*(rltInput3()=='Correct')})
  scrInput4 <- reactive({scrQuestion(rltInput4(),4)*(rltInput4()=='Correct')})
  scrInput5 <- reactive({scrQuestion(rltInput5(),5)*(rltInput5()=='Correct')})
  scrInput6 <- reactive({scrQuestion(rltInput6(),6)*(rltInput6()=='Correct')})
#   scrInput7 <- reactive({scrQuestion(rltInput7(),7)*(rltInput7()=='Correct')})
#   scrInput8 <- reactive({scrQuestion(rltInput8(),8)*(rltInput8()=='Correct')})
#   scrInput9 <- reactive({scrQuestion(rltInput9(),9)*(rltInput9()=='Correct')})
#   scrInput10 <- reactive({scrQuestion(rltInput10(),10)*(rltInput10()=='Correct')})
  
  ##Calculate total points left and print result
  output$scr <- renderText({paste0('Je score is: ',scrInput1() + scrInput2() + scrInput3() + scrInput4() + scrInput5()  + scrInput6(),
                                   ' (of ', round((scrInput1() + scrInput2() + scrInput3() + scrInput4() + scrInput5() + scrInput6())*100/12,0),
                                   '%)')})

  ##Prepare user data and print
  userData <- reactive({input$goButton
                         strsplit(isolate(input$userData),',')
                        })
  output$user <- renderText(paste0("User name: ",userData()[[1]][1],", From: ",userData()[[1]][2]))
  
  ##Assess number of trials and print
  trials <- reactive({input$goButton})
  output$value <- renderText(paste0('Pogingen: ', trials()))
  
  urlText <- renderText({
    paste(sep = "",
          session$clientData$url_protocol, "//",
          session$clientData$url_hostname, ":",
          session$clientData$url_port,"",
          session$clientData$url_pathname
    )
  })
  
  ##Check whether number of trials variable is empty and if not save data to csv
  observe({if(length(trials()) != 0) {
          quiz <- data.frame(Sys.time(), urlText(), session$clientData$url_search, 
                             userData()[[1]][1], userData()[[1]][2], trials(),
                             scrInput1(), scrInput2(),scrInput3(), scrInput4(), scrInput5(), scrInput6())
          write.table(quiz, file='results.csv', append=TRUE, sep=",", row.names=FALSE,
                      col.names=FALSE)
          }
          })
  })

  