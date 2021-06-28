#Apriori 

#Data Preprocessing

dataset = read.csv('Market_Basket_Optimisation.csv', header=FALSE)

install.packages('arules')
library(arules)

dataset = read.transactions('Market_Basket_Optimisation.csv', sep=',',
                            rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 100)

#training Apriori on the dataset

rule = apriori(data = dataset, parameter = list(support = 0.004, 
                                                confidence = 0.4))

#visualising the Result


inspect(sort(rule, by = 'lift')[1:10])









