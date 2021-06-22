#MULTIPLE LINEAR REGRESSION 

#IMPORT THE DATASET 

dataset = read.csv('50_Startups.csv')

#ENCODING CATEGORICAL VARIABLE

dataset$State = factor(dataset$State, 
                       levels = c('New York','California','Florida'),
                       labels = c(1,2,3))


#SPLITING THE TRAINING SET AND THE TEST SET 

library(caTools)
set.seed(123)

split = sample.split(dataset$Profit, SplitRatio = 2/3 )

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#FITTING THE MULTIPLE LINEAR REGRESSION

regressor = lm(formula = Profit ~ ., data = training_set)

summary(regressor)

#PREDICTING THE TEST SET 

y_predict = predict(regressor, newdata = test_set)

#BULTING THE OPTIMAL MODEL USING BACKWARD ELIMINATION

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, 
               data = training_set)

summary(regressor)

# 1 pART

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend, 
               data = training_set)

summary(regressor)

#PAET 2

regressor = lm(formula = Profit ~ R.D.Spend, 
               data = training_set)

summary(regressor)


#PART 3

















