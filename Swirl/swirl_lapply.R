#flags dataset http://archive.ics.uci.edu/ml/datasets/Flags
cls_list <- lapply(flags, class)
as.character(cls_list)
#First, use flag_colors <- flags[, 11:17] to extract the columns
# containing the color data and store them in a new data frame called
# flag_colors. 

lapply(flag_colors, sum) # gives number of countries having some colours
sapply(flag_colors, sum) # prettier

sapply(flag_colors, mean)

flag_shapes <- flags[, 19:23]

lapply(flag_shapes, range)

unique_vals <- lapply(flags, unique)

sapply(unique_vals, length)

lapply(unique_vals, function(elem) elem[2])
