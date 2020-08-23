#===========================================================================================================================#
#
#                                    Linear Discriminant Classification of 3 Classes
#                                               By - Arshan and Yash
#
#===========================================================================================================================#

#Importing libraries and data
library(car)
library(MASS)
# install.packages('rattle')
data(wine, package='rattle')
attach(wine)

head(wine)

scatterplotMatrix(wine[2:6])

wine.lda <- lda(Type ~ ., data=wine)

wine.lda

#This means that the first discriminant function is a linear combination of the variables: 
#???0.403???Alcohol+0.165???Malic??????0.003???Proline. For convenience, the value for each discriminant function 
#(eg. the first discriminant function) are scaled so that their mean value is zero and its variance is one.

#The "proportion of trace" that is printed when you type "wine.lda" is the percentage separation achieved by each discriminant function. 
#For example, for the wine data we get the same values as just calculated (68.75% and 31.25%).

#Predict
wine.lda.values <- predict(wine.lda)

#Scatterplot which specifies seperation of 3 classes
plot(wine.lda.values$x[,1],wine.lda.values$x[,2]) # make a scatterplot
text(wine.lda.values$x[,1],wine.lda.values$x[,2],Type,cex=0.7,pos=4,col="red") # add labels

#To achieve a very good separation of the three cultivars, it would be best to use both the first and second discriminant 
#functions together, since the first discriminant function can separate cultivars 1 and 3 very well, 
#and the second discriminant function can separate cultivars 1 and 2, and cultivars 2 and 3, reasonably well.