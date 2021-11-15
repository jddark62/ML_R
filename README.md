# Machine Learning with R

## Steps used:
*	Loading the dataset
*	Summarizing the dataset 
*	Visualizing the dataset
*	Evaluating algorithms
*	Making predictions

## Standard Dataset Iris
[UCI Machine Learning Repository - Iris](https://archive.ics.uci.edu/ml/datasets/Iris)

## Creating a validation dataset:
80% of data is used to train models. 20% of data is used as a validation dataset.
Validation dataset is used to know the accuracy of the model obtained through training.

## Summarizing the dataset:
1.	Dimensions: how many rows and columns (instances and attributes)
2.	Types: gives an idea of the types of transforms to use and prepare the data
3.	Levels: Class variable is a factor. Factor has multiple class labels (levels).
4.	Class distribution: number of instances that belong to each class

## Visualizing dataset:
1.	Univariate Plots: plots of each variable. Input attributes(x) and Output attributes(y). 
2.	Multivariate Plots: to know the relationships between the input attributes and the class values
3.	Box and Whisker plots: linear seperations between the classes

## Evaluating Algorithms:

### Creating models and testing their accuracy.

1.	Test-harness is set-up to use 10-fold cross validation
2.	5 different models are built
3.	Best model is selected

### 10-fold cross validation:
Involves splitting the dataset into 10 subsets. Model is trained on other subsets while one subset is held out. Process is completed when accuracy estimate is provided. The algorithm’s accuracy is estimated on the dataset.

Model evaluation metric used is Accuracy. Accuracy is the percentage of correctly classified instances out of all instances.

## Building models:
* Stacking. Building multiple models (typically of differing types) and supervisor model
that learns how to best combine the predictions of the primary models.
5 different stacking algorithms were evaluated.
1.	Linear Discriminant Analysis (LDA).
2.	Classification and Regression Trees (CART).
3.	k-Nearest Neighbors (KNN)
4.	Support Vector Machines (SVM) with a radial kernel.
5.	Random Forest (RF)


