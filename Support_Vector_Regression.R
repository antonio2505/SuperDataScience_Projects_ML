#SVR

dataset = read.csv('Position_Salaries.csv')

dataset = dataset[2:3]

#FITTING THE SVR TO THE DATASET 
#install.packages('e1071')

library(e1071)

regressor = svm(formula = Salary ~ ., data = dataset, type = 'eps-regression')

#PREDICTING A NEW RESULT

y_pred = predict(regressor, data.frame(Level=6.5))

#VISUALISING THE LINEAR REGRESSION

library(ggplot2)

ggplot() +
  geom_point(aes(x= dataset$Level, y= dataset$Salary),
             colour = 'red') +
  geom_line(aes(x=dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('TRUTH OR BLUFF(POLYNOMIAL REGRESSION)') +
  xlab('POSITION LEVELS')+
  ylab('SALARY')