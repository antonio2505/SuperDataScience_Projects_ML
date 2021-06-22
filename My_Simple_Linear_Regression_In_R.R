# Linear Regression

# Import the dataset 

dataset = read.csv('Salary_Data.csv')

#spliting the training set and the test set

library(caTools)
set.seed(123)

split = sample.split(dataset$Salary, SplitRatio = 2/3)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# spliting simple linear regression to the training set

regressor = lm(formula = Salary ~ YearsExperience, data = training_set)
summary(regressor)

#Prediction the test set result

y_predict = predict(regressor, newdata = test_set)

#visualising the training set 


install.packages('ggplot2')
library(ggplot2)

ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
             colour = 'red') +
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Yeares of Experience (training set)') +
  xlab('Experience') +
  ylab('Salary')


#visualising the test set 


install.packages('ggplot2')
library(ggplot2)

ggplot() +
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
             colour = 'red') +
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Yeares of Experience (training set)') +
  xlab('Experience') +
  ylab('Salary')













