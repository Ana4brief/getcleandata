# getcleandata
homework for Getting&amp;Cleaning Data

#task 1
The script loads the test and train data in two separate dataframes, binds columns describing the subject identifier and the activity code, and binds the two dataframes by rows, to create a complete set of data (named 'all').
#task 4
The columns of dataframe 'all' are labelled with the names of the features (for the data, as in file features.txt), 'subject_id', 'activity' and 'dataset' (the last describing whether each row comes from the test or train set.
#task 3
Activities codes are replaced with activity names (as in file activity_labels.txt).
#task 2
Only features that contain the mean and standard deviation of each measurement are retained (creating dataset all_meanstd).
#task 5
An empty dataframe is created, with one row for each combination of subject_id and activity and one column for each retained feature, and filled in with the mean value for each feature, and with the values of the two factors (subject_id and acitvity).
#
The resulting dataset (all_subjectactivitymeans) is saved as a .txt file.
