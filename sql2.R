

sqldf("select     activityDesc, 
      Subjects,
      avg(tBodyAccstdX),
      avg(tBodyAccstdY),
      avg(tBodyAccstdZ),
      avg(tGravityAccstdX),
      avg(tGravityAccstdY),
      avg(tGravityAccstdZ),
      avg(tBodyAccJerkstdX),
      avg(tBodyAccJerkstdY),
      avg(tBodyAccJerkstdZ),
      avg(tBodyGyrostdX),
      avg(tBodyGyrostdY),
      avg(tBodyGyrostdZ),
      avg(tBodyGyroJerkstdX),
      avg(tBodyGyroJerkstdY),
      avg(tBodyGyroJerkstdZ),
      avg(tBodyAccMagstd),
      avg(tGravityAccMagstd),
      avg(tBodyAccJerkMagstd),
      avg(tBodyGyroMagstd),
      avg(tBodyGyroJerkMagstd),
      avg(fBodyAccstdX),
      avg(fBodyAccstdY),
      avg(fBodyAccstdZ),
      avg(fBodyAccJerkstdX),
      avg(fBodyAccJerkstdY),
      avg(fBodyAccJerkstdZ),
      avg(fBodyGyrostdX),
      avg(fBodyGyrostdY),
      avg(fBodyGyrostdZ),
      avg(fBodyAccMagstd),
      avg(fBodyBodyAccJerkMagstd),
      avg(fBodyBodyGyroMagstd),
      avg(fBodyBodyGyroJerkMagstd),
      avg(tBodyAccmeanX),
      avg(tBodyAccmeanY),
      avg(tBodyAccmeanZ),
      avg(tGravityAccmeanX),
      avg(tGravityAccmeanY),
      avg(tGravityAccmeanZ),
      avg(tBodyAccJerkmeanX),
      avg(tBodyAccJerkmeanY),
      avg(tBodyAccJerkmeanZ),
      avg(tBodyGyromeanX),
      avg(tBodyGyromeanY),
      avg(tBodyGyromeanZ),
      avg(tBodyGyroJerkmeanX),
      avg(tBodyGyroJerkmeanY),
      avg(tBodyGyroJerkmeanZ),
      avg(tBodyAccMagmean),
      avg(tGravityAccMagmean),
      avg(tBodyAccJerkMagmean),
      avg(tBodyGyroMagmean),
      avg(tBodyGyroJerkMagmean),
      avg(fBodyAccmeanX),
      avg(fBodyAccmeanY),
      avg(fBodyAccmeanZ),
      avg(fBodyAccmeanFreqX),
      avg(fBodyAccmeanFreqY),
      avg(fBodyAccmeanFreqZ),
      avg(fBodyAccJerkmeanX),
      avg(fBodyAccJerkmeanY),
      avg(fBodyAccJerkmeanZ),
      avg(fBodyAccJerkmeanFreqX),
      avg(fBodyAccJerkmeanFreqY),
      avg(fBodyAccJerkmeanFreqZ),
      avg(fBodyGyromeanX),
      avg(fBodyGyromeanY),
      avg(fBodyGyromeanZ),
      avg(fBodyGyromeanFreqX),
      avg(fBodyGyromeanFreqY),
      avg(fBodyGyromeanFreqZ),
      avg(fBodyAccMagmean),
      avg(fBodyAccMagmeanFreq),
      avg(fBodyBodyAccJerkMagmean),
      avg(fBodyBodyAccJerkMagmeanFreq),
      avg(fBodyBodyGyroMagmean),
      avg(fBodyBodyGyroMagmeanFreq),
      avg(fBodyBodyGyroJerkMagmean),
      avg(fBodyBodyGyroJerkMagmeanFreq),
      avg(angletBodyAccMeangravity),
      avg(angletBodyAccJerkMeangravityMean),
      avg(angletBodyGyroMeangravityMean),
      avg(angletBodyGyroJerkMeangravityMean),
      avg(angleXgravityMean),
      avg(angleYgravityMean),
      avg(angleZgravityMean)
      FROM dt
      WHERE tBodyAccstdX IS NOT NULL AND
      tBodyAccstdY IS NOT NULL AND
      tBodyAccstdZ IS NOT NULL AND
      tGravityAccstdX IS NOT NULL AND
      tGravityAccstdY IS NOT NULL AND
      tGravityAccstdZ IS NOT NULL AND
      tBodyAccJerkstdX IS NOT NULL AND
      tBodyAccJerkstdY IS NOT NULL AND
      tBodyAccJerkstdZ IS NOT NULL AND
      tBodyGyrostdX IS NOT NULL AND
      tBodyGyrostdY IS NOT NULL AND
      tBodyGyrostdZ IS NOT NULL AND
      tBodyGyroJerkstdX IS NOT NULL AND
      tBodyGyroJerkstdY IS NOT NULL AND
      tBodyGyroJerkstdZ IS NOT NULL AND
      tBodyAccMagstd IS NOT NULL AND
      tGravityAccMagstd IS NOT NULL AND
      tBodyAccJerkMagstd IS NOT NULL AND
      tBodyGyroMagstd IS NOT NULL AND
      tBodyGyroJerkMagstd IS NOT NULL AND
      fBodyAccstdX IS NOT NULL AND
      fBodyAccstdY IS NOT NULL AND
      fBodyAccstdZ IS NOT NULL AND
      fBodyAccJerkstdX IS NOT NULL AND
      fBodyAccJerkstdY IS NOT NULL AND
      fBodyAccJerkstdZ IS NOT NULL AND
      fBodyGyrostdX IS NOT NULL AND
      fBodyGyrostdY IS NOT NULL AND
      fBodyGyrostdZ IS NOT NULL AND
      fBodyAccMagstd IS NOT NULL AND
      fBodyBodyAccJerkMagstd IS NOT NULL AND
      fBodyBodyGyroMagstd IS NOT NULL AND
      fBodyBodyGyroJerkMagstd IS NOT NULL AND
      tBodyAccmeanX IS NOT NULL AND
      tBodyAccmeanY IS NOT NULL AND
      tBodyAccmeanZ IS NOT NULL AND
      tGravityAccmeanX IS NOT NULL AND
      tGravityAccmeanY IS NOT NULL AND
      tGravityAccmeanZ IS NOT NULL AND
      tBodyAccJerkmeanX IS NOT NULL AND
      tBodyAccJerkmeanY IS NOT NULL AND
      tBodyAccJerkmeanZ IS NOT NULL AND
      tBodyGyromeanX IS NOT NULL AND
      tBodyGyromeanY IS NOT NULL AND
      tBodyGyromeanZ IS NOT NULL AND
      tBodyGyroJerkmeanX IS NOT NULL AND
      tBodyGyroJerkmeanY IS NOT NULL AND
      tBodyGyroJerkmeanZ IS NOT NULL AND
      tBodyAccMagmean IS NOT NULL AND
      tGravityAccMagmean IS NOT NULL AND
      tBodyAccJerkMagmean IS NOT NULL AND
      tBodyGyroMagmean IS NOT NULL AND
      tBodyGyroJerkMagmean IS NOT NULL AND
      fBodyAccmeanX IS NOT NULL AND
      fBodyAccmeanY IS NOT NULL AND
      fBodyAccmeanZ IS NOT NULL AND
      fBodyAccmeanFreqX IS NOT NULL AND
      fBodyAccmeanFreqY IS NOT NULL AND
      fBodyAccmeanFreqZ IS NOT NULL AND
      fBodyAccJerkmeanX IS NOT NULL AND
      fBodyAccJerkmeanY IS NOT NULL AND
      fBodyAccJerkmeanZ IS NOT NULL AND
      fBodyAccJerkmeanFreqX IS NOT NULL AND
      fBodyAccJerkmeanFreqY IS NOT NULL AND
      fBodyAccJerkmeanFreqZ IS NOT NULL AND
      fBodyGyromeanX IS NOT NULL AND
      fBodyGyromeanY IS NOT NULL AND
      fBodyGyromeanZ IS NOT NULL AND
      fBodyGyromeanFreqX IS NOT NULL AND
      fBodyGyromeanFreqY IS NOT NULL AND
      fBodyGyromeanFreqZ IS NOT NULL AND
      fBodyAccMagmean IS NOT NULL AND
      fBodyAccMagmeanFreq IS NOT NULL AND
      fBodyBodyAccJerkMagmean IS NOT NULL AND
      fBodyBodyAccJerkMagmeanFreq IS NOT NULL AND
      fBodyBodyGyroMagmean IS NOT NULL AND
      fBodyBodyGyroMagmeanFreq IS NOT NULL AND
      fBodyBodyGyroJerkMagmean IS NOT NULL AND
      fBodyBodyGyroJerkMagmeanFreq IS NOT NULL AND
      angletBodyAccMeangravity IS NOT NULL AND
      angletBodyAccJerkMeangravityMean IS NOT NULL AND
      angletBodyGyroMeangravityMean IS NOT NULL AND
      angletBodyGyroJerkMeangravityMean IS NOT NULL AND
      angleXgravityMean IS NOT NULL AND
      angleYgravityMean IS NOT NULL AND
      angleZgravityMean IS NOT NULL 
      GROUP BY activityDesc, Subjects
      ")

      
      