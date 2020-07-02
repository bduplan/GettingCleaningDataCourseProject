# Import Test Data
testDataFile  <- "./UCI HAR Dataset/test/X_test.txt"                            #File of test data values
testData  <- read.table(testDataFile)
testAcFile <- "./UCI HAR Dataset/test/y_test.txt"                               #File of test activity values (walking, standing, etc)
testActivity <- read.table(testAcFile) 
testSuFile <- "./UCI HAR Dataset/test/subject_test.txt"                         #File of test subject values (the person who was subjected to the test)
testSubject <- read.table(testSuFile)

# Import Train Data
trainDataFile <- "./UCI HAR Dataset/train/X_train.txt"                          #File of training data values
trainData <- read.table(trainDataFile)
trainAcFile <- "./UCI HAR Dataset/train/y_train.txt"                            #File of training activity values
trainActivity <- read.table(trainAcFile)
trainSuFile <- "./UCI HAR Dataset/train/subject_train.txt"                      #File of test subject values (the person who was subjected to the test)
trainSubject <- read.table(trainSuFile)

# Import Features (Column Names)
featuresFile <- "./UCI HAR Dataset/features.txt"                                #File of channel/feature names
colNames <- read.table(featuresFile)
colNames <- colNames[,2]                                                        #First column is just a numeric index = 1:nrow(colNames)
colNames <- sub("BodyBody", "Body", colNames)                                   #Replace any variable names that repeat "Body" twice

# Import Activity Labels
activitiesFile <- "./UCI HAR Dataset/activity_labels.txt"                       #File of activity names
acNames <- read.table(activitiesFile)

# Set the column names of the datasets
colnames(testData) <- colNames
colnames(trainData) <- colNames
colnames(testActivity) <- "ActivityID"
colnames(trainActivity) <- "ActivityID"
colnames(testSubject) <- "SubjectID"
colnames(trainSubject) <- "SubjectID"

# Add the Activity ID and Subject ID
testData <- cbind(testActivity, testSubject, testData)
trainData <- cbind(trainActivity, trainSubject, trainData)

# Merge the Test and Train datasets (Assignment Item 1)
mergedData <- rbind(testData, trainData)

# Keep only the mean and standard deviation features (Assignment Item 2)
mergedData <- mergedData[, grepl("mean\\(\\)|std\\(\\)|ActivityID|SubjectID",   #Keeps only columns who's name includes either "mean()", "std()", Activityy ID, or SubjectID
    names(mergedData))]                   

# Make activity names descriptive (Assignment Item 3)
mergedData$ActivityID <- acNames[mergedData$ActivityID, 2]                      #Indexes the activity id's dataset with the activity id from the test/train data

# Find the average of each variable for each activity and each subject (Assignment Item 5)
avgData <- tapply(mergedData$`tBodyAcc-mean()-X`, list(mergedData$ActivityID, 
    mergedData$SubjectID), FUN=mean)








