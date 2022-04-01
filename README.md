There is a single file within the repo that is used to complete the analysis of the UCI HAR Dataset: `run_analysis.r`. Refer to \`CodeBook.md\` for the output of this script. The process that is completed in this script is as follows:

1.  Checks if the data already exists, and if not, downloads the dataset and saves to a directory labeled "data".

2.  Assigns the paths to all the relevant data files within the UCI HAR Dataset to variables. The paths point to the data folder downloaded in step 1.

3.  Functions are created to:

    1.  Import the data and create a dataframe using `dplyr`
    2.  Process the X, y, and subject datasets. These functions clean up the variable names, assign proper variable names where missing, and in the case of the X data, selects only the relevant variables: "mean" and "std" variables.
    3.  Merge the X, y, and subject datasets. The merge is complete using `cbind` as to preserve all the columns. The assumption with this function is the data order has not changed from it's original form, otherwise the data will not be accurate.
    4.  Merge the training and testing dataset. The merge is completed using `rbind` as to preserve all the rows, the order is irrelevant within this function. As well the data is ordered by the subject, then the activity, before being returned.

4.  The script continues by getting the processed X, y, and subject data for both the training and testing datasets.

5.  The X, y, and subject data is merged for both training and testing, into respective datasets.

6.  The training and testing datasets are then merged into one object call `complete_dataset`

7.  Using `complete_dataset` a summary dataset is created that groups by the activity and subject, then takes the average of the remaining variables.

8.  The summary dataset is written to a CSV file called "tidy_dataset.csv"

9.  Finally, the larger objects are removed from the environment to free memory.
