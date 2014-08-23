coeff <- sample(10, 4)
a <- coeff[1]
b <- coeff[2]
c <- coeff[3]
d <- coeff[4]

q <- paste0(a,' + (', b, ' + ', c, ') x ', d, ' =')
cat(q)