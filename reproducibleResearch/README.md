##CODEBOOK
The TidyDataSet contains a **total of 68 variables**:

1. **subject**: refers to the individual who generated all the data metrics by using the Samsung phone
2. **activity**: 6 activities subjects were asked to perform in order to capture data
3. **rest of the variables**: are the average values for a set of signals

------------------------------
##PROCEDURE
### 1.
from the instructions given in the course website, the starting point was to load required data which consists of: 

- a. test and train set (subject, activity reference and signal)
- b. features.txt file
- c. activity labels

*Note: in this stage, the corresponding R script that was written assumes that the folder that contains all the information was unzipped and stored in the working directory (with no changes within the actual folder)*

### 2.
Once all the necessary data was loaded into de workspace, the next step was to combine the data frames, first by same type (e.g. test subject data with train subject data) and then binding them by column. The resulting data frame was named "newDataSet"

### 3.
subsequently, heading names were inserted to the new data set (subject, activity, rest of variables)

### 4.
variables in the new data set which measured mean() and std() were selected and the rest were dropped. Note: variables such as meanFreq() or stdFreq() were also dropped as the instructions stated that only the mean() and std() were of interest

### 5.
the data in variable "activity", which indicates the activity the subject was doing when data was being generated, were replaced from numbers (from 1:6) to more human-interpretable data ("walk","walkUp","walkDown","sit","stand","lay")

### 6.
from the processed data set "newDataSet", a second and independent tidy data set ("tidyDataSet") was created which calculates the average values for each variable in the newDataSet by subject and activity

### 7.
finally, this second data set was exported to a ".txt" file so that it can be shared with other users

### Final Note: 
These 7 steps mentioned above coincide with the steps performed in the R script. the actual script contains additional comments that can be found in the run_analysis.R file 