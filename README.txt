Create subject tables from subject_train.txt and subject_test.txt
  
Create activity table from activity_labels.txt file with activity code and descriptive name
Asign descriptive names to columns of the table
    
Create train and test data tables with values from x_train.txt and x_test.txt files
  
Create train and test subject tables from y_train.txt and y_test.txt files
Rename it´s column with descriptive name
  
Create vector with variable descriptive names from features.txt file
Rename train and test data columns with descriptive names from previous vector

Add a column with subject code to train and test data tables 
  
Create test and train activity tables with activity codes from y_train.txt and y_test.txt files
  
Add a new column to any train or test data files with activity codes
  
Add a new column to train and test data tables with distintive values indicating the original file (train/test) 

Add al the rows from test data table to train data to have a unique table with all the values
  
Add a new column to the unique (test+train) table with descriptive names for the activities
  
Discard all variable columns except those containing "mean" or "std"

Transform the data table (test+train) to have a different row for every variable column
 
Calculate mean of the column value for every phase/subject/activity/variable group
  
Write the result table to a txt file in the work directory