#Load questions
questions <- read.csv(file='Vragen.csv', colClasses = 'character', header = TRUE)

#Set initial values of last choice (currently not relevant)
last <- c(vraag$Antwoord[1], vraag$Antwoord[2], vraag$Antwoord[3])
