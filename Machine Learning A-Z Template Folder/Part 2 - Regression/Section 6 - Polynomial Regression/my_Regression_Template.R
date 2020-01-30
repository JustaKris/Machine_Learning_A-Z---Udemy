# Regression Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# # Splitting the dataset into the Training set and Test set
# # install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Salary, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)


# Fitting the Regression model to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ .,
              data = dataset)

# Predict a new result
y_pred = predict(regressor, data.frame(Level = 6.5))
summary(y_pred)

# Visualizing the Regression Model results
# install.package(ggplot2)
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = "red") +
  geom_line(aes(dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = "red") +
  ggtitle('Truth or Bluff (Plynomial Regression)') +
  xlab('Level') +
  ylab('Salary')


# Visualizing the Regression model results (x_grid for higher resolution and smoother curve)
# install.package(ggplot2)
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = "red") +
  geom_line(aes(x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = "blue") +
  ggtitle('Truth or Bluff (Plynomial Regression)') +
  xlab('Level') +
  ylab('Salary')






