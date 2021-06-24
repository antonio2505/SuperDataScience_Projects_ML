#DECISION TREE REGRESSION MODEL (NO LINEAR)

dataset = read.csv('Position_Salaries.csv')

dataset = dataset[2:3]

#FITTING THE DECISION TREE REGRESSION IN THE WHOLE DATASET 

install.packages('rpart')
library(rpart)

regressor = rpart(formula = Salary ~ ., data = dataset,
                  control = rpart.control(minsplit = 1))

#predicting a new result

y_pred = predict(regressor, data.frame(Level = 6.5))



#VISUALISING THE LINEAR REGRESSION

library(ggplot2)

x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)

ggplot() +
  geom_point(aes(x= dataset$Level, y= dataset$Salary),
             colour = 'red') +
  geom_line(aes(x=x_grid, y = predict(regressor, newdata = data.frame(Level=x_grid))),
            colour = 'blue') +
  ggtitle('TRUTH OR BLUFF(DECISION TREE REGRESSION)') +
  xlab('POSITION LEVELS')+
  ylab('SALARY')

