# Function to check whether a package exists
source('C:/Users/NB/Google Drive/Data Analysis/Shinies/Quiz ii/Globals.R')

IsInstalled <- function(mypkg) is.element(mypkg, installed.packages()[,1])

# Function to check question
chkQuestion <- function(answer, correct, index) {
  last[index] <<- answer
  message <- if(answer == correct) 'Correct' else 'False'
  return(message)}

scrQuestion1 <- function(result1) {
  vscore1 <- (result1 == 'False') * -1
  tscore1 <<- tscore1 + vscore1
  return(as.numeric(max(0,tscore1)))}

scrQuestion2 <- function(result2) {
  vscore2 <- (result2 == 'False') * -1
  tscore2 <<- tscore2 + vscore2
  return(as.numeric(max(0,tscore2)))}

scrQuestion3 <- function(result3) {
  vscore3 <- (result3 == 'False') * -1
  tscore3 <<- tscore3 + vscore3
  return(as.numeric(max(0,tscore3)))}
