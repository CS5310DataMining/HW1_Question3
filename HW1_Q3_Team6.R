# HW_1 Questio_3
#Team: 6
#Team Members:
#Melvin Zaldivar - Members contribution: 33.33%
#Rahim Abdulmalik - Members contribution: 33.33%
#Raul Beiza - Members contribution: 33.33%

# Due Date: February 2, 2020

## k-NN Lazy Learning - Classfication Using 
#  Nearest Neighbor

#====================================================
# Step-1 Import the data
#====================================================

# Import the iris training data set
iris_training <- read.csv("iris_training.csv", stringsAsFactors = FALSE)

# Import the iris test data set
iris_test <- read.csv("iris_test.csv", stringsAsFactors = FALSE)

# Switch Species from character to factor
iris_training$Species <- factor(iris_training$Species)

# Adding Specites column to test data
iris_test$Species <- factor(0)

data.frame(iris_training)
data.frame(iris_test)

# Obtain outcome of the Species and create table
table(iris_training$Species)

# Obtain percentage for each diagnose case
round(prop.table(table(iris_training$Species))*100, digits = 1)

# Normalizing numeric data
normalize <- function(x) {
  return ((x - min(x))/(max(x)-min(x)))
}

# Apply the normalize function to columns 2 through 31
iris_training_n <-as.data.frame(lapply(iris_training[2:5], normalize))
iris_test_n <-as.data.frame(lapply(iris_test[2:5], normalize)) 

# Confrim the transformation was applied correctly
summary(iris_training_n)

# Creating labels
iris_train_labels <- iris_training[1:105,6]
print(iris_train_labels)

iris_test_labels <- iris_test[106:150,5]
print(iris_test_labels)

#================================================
# Step-2: Train a model on the data
#================================================

# Install the "class" package for k-NN
install.packages("class")

# Load the "class package for k-NN
library(class)

# Performing k-NN
iris_test_pred <- knn(train=iris_training_n, test=iris_test_n, cl=iris_train_labels, k=10)

#================================================
# Step-3: View Data Results in table
#================================================

# Viewing results
iris_test_pred

# Adding Species column to test data
iris_test$Species <- iris_test_pred
iris_test <- iris_test[,-(2:5)]

#Viewing Est Data
View(iris_test)

#================================================
# Step-4: Improve model
#================================================




