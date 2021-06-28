#Hierichical clustering

#import the dataset

dataset = read.csv('Mall_Customers.csv')
x= dataset[4:5]

# using the dendrogranm to find the optimal number of clusters

dendrogram = hclust(dist(x, method = 'euclidean'), method = 'ward.D')

plot(dendrogram, main = paste('Dendogram'), xlab = 'Customers', 
     ylab = 'Euclidean Distance')

#fitting the hierarchical clustering on the mall dataset

hc= hclust(dist(x, method = 'euclidean'), method = 'ward.D')
y_hc = cutree(hc, 5)


#visualising
library(cluster)
clusplot(x,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Clients'),
         xlab = 'Annul Income',
         ylab = 'Spending Score')
