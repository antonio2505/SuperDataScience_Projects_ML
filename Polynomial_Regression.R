
# POLYNOMIAL REGRESSION

#IMPORT THE DATASET 

dataset = read.csv('Position_Salaries.csv')

dataset = dataset[2:3]

#FITTING THE LINEAR REGRESSION TO THE DATASET 



lin_reg = lm(formula = Salary ~ ., data = dataset)
summary(lin_reg)


#FITTING THE POLYNOMIAL REGRESSION TO THE DATASET

dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4

poly_reg = lm(formula = Salary ~ ., data = dataset)
summary(poly_reg)

#VISUALISING THE LINEAR REGRESSION

library(ggplot2)

ggplot() +
  geom_point(aes(x= dataset$Level, y= dataset$Salary),
             colour = 'red') +
  geom_line(aes(x=dataset$Level, y = predict(lin_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('TRUTH OR BLUFF(LINEAR REGRESSION)') +
  xlab('POSITION LEVELS')+
  ylab('SALARY')



#VISUALISING THE LINEAR REGRESSION



ggplot() +
  geom_point(aes(x= dataset$Level, y= dataset$Salary),
             colour = 'red') +
  geom_line(aes(x=dataset$Level, y = predict(poly_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('TRUTH OR BLUFF(POLYNOMIAL REGRESSION)') +
  xlab('POSITION LEVELS')+
  ylab('SALARY')

#PREDICTING  A NEW RESULT WITH LINEAR REGRESSION 

y_pred = predict(lin_reg, data.frame(Level=6.5))


#PREDICTING A NEW RESULT WITH POLYNOMIAL REGRESSION 

y_pred = predict(poly_reg, data.frame(Level=6.5,
                                     Level2=6.5^2,
                                     Level3=6.5^3,
                                     Level4=6.5^4))














