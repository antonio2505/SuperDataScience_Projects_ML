# K-Means Clustering 

#import the dataset 

dataset <- read.csv('Mall_Customers.csv')
x <- dataset[4:5]

#using the albow method to fing the optimal number
#of clusters

set.seed(6)
wcss <- vector()
for (i in 1:10) wcss[i] <- sum(kmeans(x, i)$withinss)
plot(1:10, wcss, type = "b", main = paste('Clusters of Client'), 
     xlab = 'Numbers of clusters', ylab = 'wcss')

#Applying k-means to the mall dataset

set.seed(29)
kmeans <- kmeans(x, 6, iter.max = 300, nstart = 10)

#visualising the clusters

library(cluster)
clusplot(x,
         kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Clients'),
         xlab = 'Annul Income',
         ylab = 'Spending Score')


