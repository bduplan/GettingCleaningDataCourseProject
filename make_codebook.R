varNames <- names(mergedData)
varNum <- 1:length(varNames)

varDesc <- sub("^t", "Time-domain ", varNames)
varDesc <- sub("^f", "Frequency-domaain (FFT) ", varDesc)

varDesc <- sub("BodyAcc-", "acceleration of the subject's body, g, ", varDesc)
varDesc <- sub("GravityAcc-", "acceleration due to gravity, g, ", varDesc)
varDesc <- sub("BodyAccJerk-", "jerk of the subject's body, g/s, ", varDesc)
varDesc <- sub("BodyGyro-", "angular rate of the subject's body, rad/s, ", varDesc)
varDesc <- sub("BodyGyroJerk", "angular acceleration of the subject's body, rad/s/s, ", varDesc)
varDesc <- sub("BodyAccMag-", "magnitude of the Euclidian vector sum of body acceleration X, Y, and Z components, g, ", varDesc)
varDesc <- sub("GravityAccMag-", "magnitude of the Euclidian vector sum of gravity acceleration X, Y, and Z component, g, ", varDesc)
varDesc <- sub("BodyAccJerkMag-", "magnitude of the Euclidian vector sum of body jerk X, Y, and Z components, g/s, ", varDesc)
varDesc <- sub("BodyGyroMag-", "magnitude of the Euclidian vecotr sum of body angular rate X, Y, and Z components, rad/s, ", varDesc)
varDesc <- sub("BodyGyroJerkMag-", "magnitude of the Euclidian vecotr sum of body angular acceleration X, Y, and Z components, rad/s/s, ", varDesc)

varDesc <- sub("mean\\(\\)", "mean value estimation", varDesc)
varDesc <- sub("std\\(\\)", "standard deviation estimation", varDesc)

varDesc <- sub("-X$", ", X-axis", varDesc)
varDesc <- sub("-Y$", ", Y-axis", varDesc)
varDesc <- sub("-Z$", ", Z-axis", varDesc)

varDesc[1] <- "Activity"
varDesc[2] <- "Test subject identification number"

cbdf <- data.frame(cbind(varNum, varNames, varDesc))
names(cbdf) <- list("Column/Variable Number", "Variable Name", "Variable Description")

library("xtable")
print(xtable(cbdf), type="html", file="CodeBook.html", include.rownames=FALSE)