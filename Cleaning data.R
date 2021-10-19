

titanic.train <-read.csv(file="train.csv",stringsAsFactors = FALSE, header=TRUE)
tail(titanic.train)
titanic.test <-read.csv(file="test.csv", stringsAsFactors = FALSE, header= TRUE)
tail(titanic.test)
str(titanic.test)

median(titanic.train$Age, na.rm = TRUE)
median(titanic.test$Age, na.rm= TRUE)

titanic.train$IsTrainSet<-TRUE #add new column to train set
titanic.test$IsTrainSet <-FALSE #add new column to test set

ncol(titanic.test)
ncol(titanic.train)

names(titanic.test)
names(titanic.train)

titanic.test$Survived <- NA #add survived column to test data
names(titanic.test)

titanic.full<-rbind(titanic.train, titanic.test) #combine test and train datasets
tail(titanic.full)

table(titanic.full$IsTrainSet) #checking that test data seperate from train

table(titanic.full$Embarked)

titanic.full[titanic.full$Embarked == "", "Embarked"] <- 'S'

table(titanic.full$Embarked)

table(is.na(titanic.full$Age))

age.median <- median(titanic.full$Age, na.rm = TRUE)

titanic.full[is.na(titanic.full$Age), "Age"] <-age.median

is.na(titanic.full$Age)
table(is.na(titanic.full$Age))

table(is.na(titanic.full$Fare)) 

fare.median <- median(titanic.full$Fare, na.rm = TRUE)
fare.median
titanic.full[is.na(titanic.full$Fare), "Fare"] <-fare.median

table(is.na(titanic.full$Fare)) 

titanic.train <- titanic.full[titanic.full$IsTrainSet==TRUE,]

titanic.test <- titanic.full[titanic.full$IsTrainSet==FALSE,]

tail(titanic.test)
tail(titanic.train)
