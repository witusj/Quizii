#Load questions
library('MASS')
library('schoolmath')

#Question 1
n1 <- sample(c(1, 3, 5, 7, 11, 13, 17, 19, 23, 29), 4)
n2 <- c(n1[1]-n1[3], n1[2]+n1[4])
n3 <- gcd(abs(n2[1]), abs(n2[2]))

txt <- paste0('Vereenvoudig de formule : ', n1[1], 'x + ', n1[2], 'y - ', n1[3], 'x + ', n1[4], 'y')
corr <- paste0(n3, ' * (',n2[1]/n3, 'x + ', n2[2]/n3, 'y)')
fls1 <- paste0(n2[1], 'x + ', n2[2], 'y')
fls2 <- paste0(n3, ' * (', round((n1[1]+n1[3])/n3, 0), 'x + ', n2[2]/n3, 'y)')
fls3 <- paste0(n3, ' * (',-1*n2[1]/n3, 'x + ', n2[2]/n3, 'y)')

# Question 2
a1 <- sample(c(1, 3, 5, 7, 11, 13, 17, 19, 23, 29), 4)
a2 <- c(a1[1]-a1[3], a1[2]+a1[4])
a3 <- gcd(abs(a2[1]), abs(a2[2]))

txt <- c(txt, paste0('Vereenvoudig de formule : (', a1[1], 'a + ', a1[2], 'b) - (', a1[3], 'a - ', a1[4], 'b)'))
corr <- c(corr, paste0(a3, ' * (',a2[1]/a3, 'a + ', a2[2]/a3, 'b)'))
fls1 <- c(fls1, paste0(a2[1], 'a + ', a2[2], 'b'))
fls2 <- c(fls2, paste0(a3, ' *(', round((a1[1]+a1[3])/a3, 0), 'a + ', a2[2]/a3, 'b)'))
fls3 <- c(fls3, paste0(a3, ' *(', -1*a2[1]/a3, 'a + ', a2[2]/a3, 'b)'))

# Question 3
b1 <- sample(c(1, 3, 5, 7, 11, 13, 17, 19, 23), 2)
b1[3] <- 2*b1[2]
b1[4] <- 2*b1[1]
b1[5] <- sample(2*(1:5),1)
b2 <- c(b1[5]*b1[1]-b1[3], b1[5]*b1[2]+b1[4])
b3 <- gcd(abs(b2[1]), abs(b2[2]))

txt <- c(txt, paste0('Vereenvoudig de formule : ', b1[5], ' * (', b1[1], 'x + ', b1[2], 'y) - (', b1[3], 'x - ', b1[4], 'y)'))
corr <- c(corr, paste0(b3, ' * (', b2[1]/b3, 'x + ', b2[2]/b3, 'y)'))
fls1 <- c(fls1, paste0(b2[1], 'x + ', b2[2], 'y'))
fls2 <- c(fls2, paste0(b3, ' * (', round((b1[1]+b1[3])/b3, 0), 'x + ', b2[2]/b3, 'y)'))
fls3 <- c(fls3, paste0(b3, ' * (', -1*b2[1]/b3, 'x + ', b2[2]/b3, 'y)'))

# Question 4
b1 <- sample(c(1, 3, 5, 7, 11, 13), 4)
b1[5] <- sample(2*(1:3),1)
b2 <- c(b1[5]*b1[1]-b1[3], b1[5]*b1[2]+b1[4])
b3 <- gcd(abs(b2[1]), abs(b2[2]))

txt <- c(txt, paste0('Vereenvoudig de formule : ', b1[5], '* (', b1[1], 'x + ', b1[2], 'y) - (', b1[3], 'x - ', b1[4], 'y) - (', b1[5]*b1[1], 'x + ', b1[5]*b1[2], 'y)'))
corr <- c(corr, paste0(-1*b1[3], 'x + ', b1[4], 'y'))
fls1 <- c(fls1, paste0(b2[1]+b1[1], 'x + ', b2[2]+b1[2], 'y'))
fls2 <- c(fls2, paste0(b1[3], 'x - ', b1[4], 'y'))
fls3 <- c(fls3, paste0(b3, ' * (', -1*(b2[1]+b1[1])/b3, 'x + ', 2*b2[2]/b3, 'y)'))

#Question 1
n1 <- sample(c(1, 3, 5, 7, 11, 13, 17, 19, 23, 29), 4)
n2 <- c(n1[1]-n1[3], n1[2]+n1[4])
n3 <- gcd(abs(n2[1]), abs(n2[2]))

txt <- c(txt, paste0('Vereenvoudig de formule : ', n1[1], 'x + ', n1[2], 'y - ', n1[3], 'x + ', n1[4], 'y'))
corr <- c(corr, paste0(n3, ' * (',n2[1]/n3, 'x + ', n2[2]/n3, 'y)'))
fls1 <- c(fls1, paste0(n2[1], 'x + ', n2[2], 'y'))
fls2 <- c(fls2, paste0(n3, ' * (', round((n1[1]+n1[3])/n3, 0), 'x + ', n2[2]/n3, 'y)'))
fls3 <- c(fls3, paste0(n3, ' * (',-1*n2[1]/n3, 'x + ', n2[2]/n3, 'y)'))

# Question 2
a1 <- sample(c(1, 3, 5, 7, 11, 13, 17, 19, 23, 29), 4)
a2 <- c(a1[1]-a1[3], a1[2]+a1[4])
a3 <- gcd(abs(a2[1]), abs(a2[2]))

txt <- c(txt, paste0('Vereenvoudig de formule : (', a1[1], 'a + ', a1[2], 'b) - (', a1[3], 'a - ', a1[4], 'b)'))
corr <- c(corr, paste0(a3, ' * (',a2[1]/a3, 'a + ', a2[2]/a3, 'b)'))
fls1 <- c(fls1, paste0(a2[1], 'a + ', a2[2], 'b'))
fls2 <- c(fls2, paste0(a3, ' *(', round((a1[1]+a1[3])/a3, 0), 'a + ', a2[2]/a3, 'b)'))
fls3 <- c(fls3, paste0(a3, ' *(', -1*a2[1]/a3, 'a + ', a2[2]/a3, 'b)'))

# Question 3
b1 <- sample(c(1, 3, 5, 7, 11, 13, 17, 19, 23), 2)
b1[3] <- 2*b1[2]
b1[4] <- 2*b1[1]
b1[5] <- sample(2*(1:5),1)
b2 <- c(b1[5]*b1[1]-b1[3], b1[5]*b1[2]+b1[4])
b3 <- gcd(abs(b2[1]), abs(b2[2]))

txt <- c(txt, paste0('Vereenvoudig de formule : ', b1[5], ' * (', b1[1], 'x + ', b1[2], 'y) - (', b1[3], 'x - ', b1[4], 'y)'))
corr <- c(corr, paste0(b3, ' * (', b2[1]/b3, 'x + ', b2[2]/b3, 'y)'))
fls1 <- c(fls1, paste0(b2[1], 'x + ', b2[2], 'y'))
fls2 <- c(fls2, paste0(b3, ' * (', round((b1[1]+b1[3])/b3, 0), 'x + ', b2[2]/b3, 'y)'))
fls3 <- c(fls3, paste0(b3, ' * (', -1*b2[1]/b3, 'x + ', b2[2]/b3, 'y)'))

# Question 4
b1 <- sample(c(1, 3, 5, 7, 11, 13), 4)
b1[5] <- sample(2*(1:3),1)
b2 <- c(b1[5]*b1[1]-b1[3], b1[5]*b1[2]+b1[4])
b3 <- gcd(abs(b2[1]), abs(b2[2]))

txt <- c(txt, paste0('Vereenvoudig de formule : ', b1[5], '* (', b1[1], 'x + ', b1[2], 'y) - (', b1[3], 'x - ', b1[4], 'y) - (', b1[5]*b1[1], 'x + ', b1[5]*b1[2], 'y)'))
corr <- c(corr, paste0(-1*b1[3], 'x + ', b1[4], 'y'))
fls1 <- c(fls1, paste0(b2[1]+b1[1], 'x + ', b2[2]+b1[2], 'y'))
fls2 <- c(fls2, paste0(b1[3], 'x - ', b1[4], 'y'))
fls3 <- c(fls3, paste0(b3, ' * (', -1*(b2[1]+b1[1])/b3, 'x + ', 2*b2[2]/b3, 'y)'))

questionsMC <- data.frame(txt, corr, fls1, fls2, fls3, stringsAsFactors = FALSE)