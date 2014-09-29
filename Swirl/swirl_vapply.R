#flags dataset http://archive.ics.uci.edu/ml/datasets/Flags

tapply(flags$animate, flags$landmass, mean)

tapply(flags$population, flags$red, summary)

# Lastly, use the same approach to look at a summary of population values
# for each of the six landmasses.
tapply(flags$population, flags$landmass, summary)