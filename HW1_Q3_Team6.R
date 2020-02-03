# HW_1 Questio_3




#====================================================
# Step-1 Import the data
#====================================================

# Import the iris training data set
iris_training <- read.csv("iris_training.csv", stringsAsFactors = FALSE)

# Import the iris test data set
iris_test <- read.csv("iris_test.csv", stringsAsFactors = FALSE)

data.frame(iris_training)
data.frame(iris_test)

# Remove the ID feature
iris_training <-iris_training[-1]
iris_test <- iris_test[-1]

# Obtain outcome of the Species and create table
table(iris_training$Species)

# Obtain percentage for each diagnose case
round(prop.table(table(iris_training$Species))*100, digits = 1)

# Normalizing numeric data
normalize <- function(x) {
  return ((x - min(x))/(max(x)-min(x)))
}
  
# Apply the normalize function to columns 2 through 31
iris_training_n <-as.data.frame(lapply(iris_training[1:4], normalize)) 

# Confrim the transformation was applied correctly
summary(iris_training_n)

# Creating labels