# simulates 4 throws of a die
sample(1:6, 4, replace = TRUE)

sample(LETTERS) #size is implicitely length(LETTERS) == 26

# Let the value 0 represent tails and the value 1 represent heads. Use
# sample() to draw a sample of size 100 from the vector c(0,1), with
# replacement. Since the coin is unfair, we must attach specific
# probabilities to the values 0 (tails) and 1 (heads) with a fourth
# argument, prob = c(0.3, 0.7). Assign the result to a new variable
# called flips.
flips <- sample(c(0,1),100, replace=TRUE, prob = c(0.3,0.7))
sum(flips)
#should it be more or less the same result as
rbinom(1, size=100, prob=0.7)
flips2 <- rbinom(100, size=1, prob=0.7)
sum(flips2)

my_pois <- replicate(100, rpois(5, lambda = 10))
