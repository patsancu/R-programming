my_matrix <- matrix(1:20,4,5)
patients <- c("Bill", "Gina", "Kelly", "Sean")
cbind(patients, my_matrix) # coerces numbers to strings

my_data <- data.frame(patients,my_matrix) # this is better
cnames <- c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data) <- cnames