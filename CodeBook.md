# The Data
The data used within this script is originally from the [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#).
There are two output datasets, one stored outputted to a txt file called
"tidy_dataset.txt" and the other as a variable within R call 'complete_datset'.

The `complete_dataset` is simply the merged training and test datasets,
with both the X, y, and subject data included. The variables are formatted, and
the activity data is made into a factor variable.

The "tidy_dataset.txt" is a dataset that starts with the `complete_dataset`, and 
summaries it, grouping the activities and subjects, and averaging the remaining 
variables.

### Transformations
The following changes were made to the original dataset:

- Variables modified to be more suitable for R: removed characters ('()', '-') that do not work within the language, and replaced with '_'. 
- Variable names were made all lower case.
- Merged the X, y, and subject data into one dataset.
- Subject data was transformed to a factor variable.
- The output to the 'tidy_dataset.csv' groups by the activity and the subject, and averages the remaining variables with the `mean` function.

# Variables
The following are new variables introduced with the analysis script. They are 
outputed into the tidy_dataset.csv file. All the variables listed below and 
in this dataset are the average across both subject and activity. They match 
to the original dataset, only with the format of the variable names different.

*For the original dataset variables, refer to the txt files within the UCI Har
Dataset.*

### Orginal variables
- subject
- activity

### Orginal variables averaged
- tbodyacc_mean_x
- tbodyacc_mean_y	
- tbodyacc_mean_z	
- tgravityacc_mean_x	
- tgravityacc_mean_y
- tgravityacc_mean_z
- tbodyaccjerk_mean_x
- tbodyaccjerk_mean_y
- tbodyaccjerk_mean_z
- tbodygyro_mean_x
- tbodygyro_mean_y
- tbodygyro_mean_z
- tbodygyrojerk_mean_x
- tbodygyrojerk_mean_y
- tbodygyrojerk_mean_z
- tbodyaccmag_mean
- tgravityaccmag_mean
- tbodyaccjerkmag_mean
- tbodygyromag_mean
- tbodygyrojerkmag_mean
- fbodyacc_mean_x
- fbodyacc_mean_y
- fbodyacc_mean_z
- fbodyacc_meanfreq_x
- fbodyacc_meanfreq_y
- fbodyacc_meanfreq_z
- fbodyaccjerk_mean_x
- fbodyaccjerk_mean_y
- fbodyaccjerk_mean_z
- fbodyaccjerk_meanfreq_x
- fbodyaccjerk_meanfreq_y
- fbodyaccjerk_meanfreq_z
- fbodygyro_mean_x
- fbodygyro_mean_y
- fbodygyro_mean_z
- fbodygyro_meanfreq_x
- fbodygyro_meanfreq_y
- fbodygyro_meanfreq_z
- fbodyaccmag_mean
- fbodyaccmag_meanfreq
- fbodybodyaccjerkmag_mean
- fbodybodyaccjerkmag_meanfreq
- fbodybodygyromag_mean
- fbodybodygyromag_meanfreq
- fbodybodygyrojerkmag_mean
- fbodybodygyrojerkmag_meanfreq
- angle_tbodyaccmean_gravity
- angle_tbodyaccjerkmean_gravitymean
- angle_tbodygyromean_gravitymean
- angle_tbodygyrojerkmean_gravitymean
- angle_x_gravitymean
- angle_y_gravitymean
- angle_z_gravitymean
- tbodyacc_std_x
- tbodyacc_std_y
- tbodyacc_std_z
- tgravityacc_std_x
- tgravityacc_std_y
- tgravityacc_std_z
- tbodyaccjerk_std_x
- tbodyaccjerk_std_y
- tbodyaccjerk_std_z
- tbodygyro_std_x
- tbodygyro_std_y
- tbodygyro_std_z
- tbodygyrojerk_std_x
- tbodygyrojerk_std_y
- tbodygyrojerk_std_z
- tbodyaccmag_std
- tgravityaccmag_std
- tbodyaccjerkmag_std
- tbodygyromag_std
- tbodygyrojerkmag_std
- fbodyacc_std_x
- fbodyacc_std_y
- fbodyacc_std_z
- fbodyaccjerk_std_x
- fbodyaccjerk_std_y
- fbodyaccjerk_std_z
- fbodygyro_std_x
- fbodygyro_std_y
- fbodygyro_std_z
- fbodyaccmag_std
- fbodybodyaccjerkmag_std
- fbodybodygyromag_std
- fbodybodygyrojerkmag_std


