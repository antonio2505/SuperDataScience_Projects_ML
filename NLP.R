#Natural Language Processing

#import the dataset                           quote = '' ==> ignore any kind of 
                                                              #quote in the text

dataset_original = read.delim('Restaurant_Reviews.tsv', quote = '', 
                     stringsAsFactors = FALSE)

# CLeaning the dataset

#install.packages('tm')
#install.packages('SnowballC')
library(tm)
library(SnowballC)

Corpus = VCorpus(VectorSource(dataset$Review))
Corpus = tm_map(Corpus, content_transformer(tolower))
Corpus = tm_map(Corpus, removeNumbers)
Corpus = tm_map(Corpus, removePunctuation)
Corpus = tm_map(Corpus, removeWords, stopwords())
Corpus = tm_map(Corpus, stemDocument)
Corpus = tm_map(Corpus, stripWhitespace)

as.character(Corpus[[1]])

#Creating the Bag of Words Model

dtm = DocumentTermMatrix(Corpus)
dtm = removeSparseTerms(dtm, 0.999)
dataset = as.data.frame(as.matrix(dtm))
dataset$Liked = dataset_original$Liked

# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

# Encoding the target feature as factor
dataset$Liked = factor(dataset$Liked, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Liked, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Random Forest Classification to the Training set
# install.packages('randomForest')
library(randomForest)
classifier = randomForest(x = training_set[-692],
                          y = training_set$Liked,
                          ntree = 10)

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-692])

# Making the Confusion Matrix
cm = table(test_set[, 692], y_pred)




