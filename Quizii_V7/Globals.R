#Load questions
questions <- read.csv(file='Vragen.csv', colClasses = 'character', header = TRUE)
questionsMC <- questions[questions$Onderwerp == 'Financial Accounting' & questions$Subcategorie == 'Vermogensbehoefte' & questions$Type == 'MC',]
questionsOpen <- questions[questions$Onderwerp == 'Financial Accounting' & questions$Subcategorie == 'Vermogensbehoefte' & questions$Type == 'Open',]
