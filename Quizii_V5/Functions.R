source('Globals.R')

# Function to check MC question
chkQuestion <- function(answer, correct, index) {
  message <- if(answer == correct) 'Correct' else 'False'
  return(message)}

# Function to check open question
chkQuestionOpen <- function(answer, correct) {
  message <- if(grepl(correct, answer, perl=TRUE)) 'Correct' else if(answer != '') 'False' else 'Leeg'
  return(message)}

# Functions to calculate score
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

scrQuestion4 <- function(result4) {
  vscore4 <- (result4 == 'False') * -1
  tscore4 <<- tscore4 + vscore4
  return(as.numeric(max(0,tscore4)))}
