library(caret)
#attaching a standard dataset
data(iris)

#renaming dataset for ease
dataset <- iris

#creating validation dataset

#training set (using 80% of the rows)
valIndex <- createDataPartition(dataset$Species, p=0.80, list=FALSE)

#validation dataset (20% of data)
validation <- dataset[-valIndex,]
dataset <- dataset[valIndex,]

#dimensions of dataset
dim(dataset)

#types of each attribute
sapply(dataset, class)

#overview of data
head(dataset)

#levels of the class
levels(dataset$Species)

#class distribution (each class has same number of instances)
percentage <- prop.table(table(dataset$Species)) * 100
cbind(freq=table(dataset$Species), percentage=percentage)

#summary of dataset
summary(dataset)

#visualizing dataset

#input and output attributes
x <- dataset[,1:4]
y <- dataset[,5]

#boxplot for each attribute
par(mfrow=c(1,4))
for(i in 1:4) {
  boxplot(x[,i], main=names(iris)[i])
}

#barplot for visualizing breakdown between classes
plot(y)

#multivariate plots

#scatterplot
featurePlot(x = x, y = y, plot = "ellipse")
#ellipses are drawn around points for each class

#box and whisker plot
#box captures middle 50% of data
#line shows the median
#whiskers of the plot show resonable extent of data
featurePlot(x = x, y = y, plot = "box")

#density plots for each distribution
scales <- list(x=list(relation="free"), y=list(relation="free"))
#scale transform calculates the standard deviation for an attribute and divides each value by that standard deviation
featurePlot(x=x, y=y, plot="density", scales=scales)

#Evaluating alogrithms

#Test-harness
trainControl <- trainControl(method="cv", number=10)
metric <- "Accuracy"

#Building models
# LDA
set.seed(7)
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric,
                 trControl=trainControl)
# CART
set.seed(7)
fit.cart <- train(Species~., data=dataset, method="rpart", metric=metric,
                  trControl=trainControl)
# KNN
set.seed(7)
fit.knn <- train(Species~., data=dataset, method="knn", metric=metric,
                 trControl=trainControl)
# SVM
set.seed(7)
fit.svm <- train(Species~., data=dataset, method="svmRadial", metric=metric,
                 trControl=trainControl)
# Random Forest
set.seed(7)
fit.rf <- train(Species~., data=dataset, method="rf", metric=metric, trControl=trainControl)

#best model selection
#accuracy of models is summarized
results <- resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, svm=fit.svm, rf=fit.rf))
summary(results)

#accuracy of models is compared
dotplot(results)

#LDA is the most accurate algorithm, so LDA model is summarized
print(fit.lda)

#confusion matrix is used to summarize the LDA model on the validation set
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)