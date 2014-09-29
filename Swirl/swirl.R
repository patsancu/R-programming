# install.packages("swirl")
library(swirl)
install_from_swirl("R Programming")
swirl()


#2
seq(along.with = my_seq)
seq_along(my_seq)
rep(c(0, 1, 2), each = 10)

#3
tf <- num_vect < 1
paste(my_char, collapse = " ")


#4
# To make things a little more interesting, lets
# create a vector containing 1000 draws from a
# standard normal distribution with y <- rnorm(1000).
y <- rnorm(1000)

#Finally, let's select 100 elements at random from
# these 2000 values (combining y and z) such that we
# don't know how many NAs we'll wind up with or what
# positions they'll occupy in our final vector --
# my_data <- sample(c(y, z), 100)
my_data <- sample(c(y, z), 100)
my_na <- is.na(my_data)
sum(my_na) #Number of na values, because False = 0, True = 1
Inf - Inf #NaN


#5
x[is.na(x)] #Vector. If not empty, all elements na
y[y>0]
x[!is.na(x) & x > 0]
x[c(3,5,7)]

x[c(-2, -10)]#X vector without the 2nd and 10th elements
#same as
x[-c(2, 10)]

names(vect2) <- c("foo", "bar", "norf") #Name an (unnamed) vector
identical(vect, vect2)