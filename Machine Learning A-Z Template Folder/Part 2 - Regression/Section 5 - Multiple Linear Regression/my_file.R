# Simple Linear Regression

# Importing the dataset
dataset = read.csv('50_Startups.csv')
# dataset = dataset[, 2:3]

# Encoding Categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

# Splitting the dataset into the Training and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 4/5)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature scaling
# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])

# Fitting Multiple Linear Regressing to the Training set
# regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, data = training_set) 
regressor = lm(formula = Profit ~ .,
               data = training_set) # Same as above but shorter

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# # Checking how the predictions gets affected by removing the almost insignificant variables
# regressor = lm(formula = Profit ~  R.D.Spend,
#                data = training_set) # Same as above
# 
# y_pred = predict(regressor, newdata = test_set)


# Building the optimal model using Backwards elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend,
               data = dataset)
summary(regressor)

# # Automatic Backward elimination with R value
# backwardElimination <- function(x, sl) {
#   numVars = length(x)
#   for (i in c(1:numVars)){
#     regressor = lm(formula = Profit ~ ., data = x)
#     maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
#     if (maxVar > sl){
#       j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
#       x = x[, -j]
#     }
#     numVars = numVars - 1
#   }
#   return(summary(regressor))
# }
# 
# SL = 0.05
# dataset = dataset[, c(1,2,3,4,5)]
# backwardElimination(training_set, SL)

