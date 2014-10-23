##CodeBook
This code book describes the variables, the data, and any transformations or work that was performed to clean up the data.

###The data source

A full description is available at the site where the data about the original project were obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the project were stored at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

###The data

The dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data with the equivalent descriptions:
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

###Transformation details

The script consists of 6 parts:

0. Preparation level (includes checking necessary R package installation, data downloading and primary processing)
1. Merging both train and test sets to create a common data set.
2. Extracting only the measurements on the mean and standard deviation for each measurement.
3. Using descriptive activity names to name the activities in the data set.
4. Labelling the data set with descriptive activity names in the appropriate manner.
5. Creating an independent tidy data set with the average of each variable for each activity and each subject.

The script requires available Internet connection and the data.table R package (installed and launched automatically).
