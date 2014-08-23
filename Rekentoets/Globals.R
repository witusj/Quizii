#Load questions
library('MASS')

#Question 1
n1 <- sample(5,1)
n2 <- sample(4,1)

n1n2 <- as.double(paste0(n1,n2))
cat(n1n2)

txt <- paste0(11, ' x ', n1n2, ' =')
corr <- 11*n1n2
fls1 <- 10*n1n2
fls2 <- 900*n1+11*n1n2
fls3 <- 11*(n1+n2)

# Question 2
coeff <- sample(2:9, 4)
a1 <- coeff[1]
b1 <- coeff[2]
c1 <- coeff[3]
d1 <- coeff[4]

txt <- c(txt, paste0(a1,' + (', b1, ' + ', c1, ') * ', d1, ' ='))

corr = c(corr, a1+(b1+c1)*d1)
fls1 <- c(fls1, a1+b1+c1*d1)
fls2 <- c(fls2, (a1+b1+c1)*d1)
fls3 <- c(fls3, a1+b1+c1+d1)

# Question 3
coeff <- sample(c(3, 5, 7, 11), 2)
e1 <- coeff[1]
f1 <- coeff[2]

txt <- c(txt, paste0('\\(\\dfrac{', e1-1,'}{', e1, '} * \\dfrac{', 2*e1, '}{', f1,  '} =\\)'))

corr = c(corr, as.character(fractions(2*(e1-1)/f1)))
fls1 <- c(fls1, as.character(fractions(f1/e1)))
fls2 <- c(fls2, as.character(fractions((e1-1)/f1)))
fls3 <- c(fls3, as.character(fractions(e1/f1)))

# Question 4
coeff <- sample(list(c('a','b'), c('m','n'), c('p','q'), c('x','y')), 1)
g1 <- coeff[[1]][1]
h1 <- coeff[[1]][2]

txt <- c(txt, paste0('\\((', g1,' + ', h1, ')^{2}', ' =\\)'))

corr = c(corr, paste0('\\(', g1, '^{2}', ' + 2*', g1, '*', h1, ' + ', h1, '^{2}\\)'))
fls1 <- c(fls1, paste0('\\(', g1, '^{2}', ' + ', h1, '^{2}\\)'))
fls2 <- c(fls2, paste0('\\(', g1, ' + ', h1, '^{2}\\)'))
fls3 <- c(fls3, paste0('\\(2 * (', g1,' + ', h1, ')\\)'))

# Question 5
coeff <- sample(c(1:9), 1)
i1 <- coeff+50

txt <- c(txt, paste0('\\(', i1, '^{2}', ' =\\)'))

corr = c(corr, i1^2)
fls1 <- c(fls1, 2500+coeff^2)
fls2 <- c(fls2, 2*i1)
fls3 <- c(fls3, 50*i1)

# Question 6
coeff <- sample(c('a','b', 'p', 'r', 't', 'x'), 1)
j1 <- coeff

txt <- c(txt, paste0('\\((1 + ', j1,')^{-1} =\\)'))

corr = c(corr, paste0('\\(\\frac{1}{(1 + ', j1,')}\\)'))
fls1 <- c(fls1, paste0('\\(1 + ', j1, '\\)'))
fls2 <- c(fls2, paste0('\\((1 + ', j1,')^{2}\\)'))
fls3 <- c(fls3, paste0('\\(1 + ', j1,'^{-1}\\)'))

# Question 7
coeff <- sample(c(11, 12, 15, 20), 1)
k1 <- coeff

txt <- c(txt, paste0('\\(', k1^2,'^{0,5} =', '\\)'))

corr = c(corr, k1)
fls1 <- c(fls1, 0.5*k1^2)
fls2 <- c(fls2, paste0('1/',k1^2))
fls3 <- c(fls3, paste0('1/',k1))

# Question 8
coeff <- sample(c(2:8), 2)
l <- coeff[1]
m <- coeff[2]

txt <- c(txt, paste0('\\(x^{',l,'}*x^{',m,'}=\\)'))

corr = c(corr, paste0('\\(x^{',l+m, '}\\)'))
fls1 <- c(fls1, paste0('\\(x^{',l*m, '}\\)'))
fls2 <- c(fls2, paste0('\\(', l+m,'*x\\)'))
fls3 <- c(fls3, paste0('\\(x * ', l,' * x *', m, '\\)'))

# Question 9
coeff <- sample(c(1:10), 1)
n3 <- 5*coeff

txt <- c(txt, paste0('\\(\\dfrac{',n3,'}{0,2}=\\)'))

corr = c(corr, n3/0.2)
fls1 <- c(fls1, n3*0.2)
fls2 <- c(fls2, n3/2)
fls3 <- c(fls3, n3*10)

# Question 10
coeff <- sample(c(2:4), 1)
o <- coeff

txt <- c(txt, paste0('Als 5 EUR = 20% en X EUR = ', o*20, '%, dan is X ='))

corr = c(corr, 5*o)
fls1 <- c(fls1, o)
fls2 <- c(fls2, 25)
fls3 <- c(fls3, o-1)

# Question 11
coeff <- sample(c(2, 3, 5, 7, 11), 2)
p <- coeff[1]
q <- coeff[2]

txt <- c(txt, paste0('Als \\({a + b = c}\\) en \\(\\dfrac{a}{b} = \\dfrac{', p, '}{', q, '}\\) dan geldt \\(\\dfrac{a}{c} =\\)'))

corr = c(corr, paste0(p, '/', p+q))
fls1 <- c(fls1, round(p/q, 2))
fls2 <- c(fls2, paste0(q, '/', p))
fls3 <- c(fls3, paste0(q, '/', p+q))

# Question 12
coeff <- sample(c(2, 3, 5, 7, 11), 2)
p <- coeff[1]
q <- coeff[2]

txt <- c(txt, paste0('(', p, ' * a + (a - b) * ', q, ') / ', p, ' ='))

corr = c(corr, paste0('a + (a - b) * ', q, ' / ', p))
fls1 <- c(fls1, paste0('(',(p+1),'*a - b) * ', q, ' / ', p))
fls2 <- c(fls2, paste0((p+1),'*a - b * ', q, ' / ', p))
fls3 <- c(fls3, paste0('a - b * ', q, ' / ', p))

# Question 13
coeff <- sample(c(4, 6, 5, 8, 9), 1)
r <- coeff

txt <- c(txt, paste0('\\(Y = \\dfrac{1}{(1,0', r, ')^{t}} \\)=> als t toeneemt dan:'))

corr = c(corr, 'neemt Y af')
fls1 <- c(fls1, 'groeit Y lineair')
fls2 <- c(fls2, 'groeit Y exponentieel')
fls3 <- c(fls3, 'verandert Y niet')
questionsMC <- data.frame(txt, corr, fls1, fls2, fls3, stringsAsFactors = FALSE)
