#Eclat Model


#Data Preprocessing Eclat

dataset = read.csv('Market_Basket_Optimisation.csv', header=FALSE)

install.packages('arules')
library(arules)

dataset = read.transactions('Market_Basket_Optimisation.csv', sep=',',
                            rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 100)

#training Eclat on the dataset

rule = eclat(data = dataset, parameter = list(support = 0.003, minlen= 2))

#visualising the Result


inspect(sort(rule, by = 'support')[1:10])









