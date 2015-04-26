---
output: html_document
---
ReadMe for the Course Project of Getting and Cleaning
------------------------------------------
#### Preparation
The script uses the ```plyr``` package, which is loaded at the beginning. In other words, it assumes the executing R installation only needs to load it. If not, please run ```install.packages("plyr")``` beforehand.
The authors of the original dataset require mentioning of their work, as follows: 
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

#### Merging of the test and training sets:
1. For each set, training and test, a data.frame was build, holding the data from X_***.txt, the corresponding activity IDs from y_***.txt and performing subject IDs from subject_***.txt. Each file was loaded into a data.frame, and the resulting data.frames merged using ```cbind```.
2. The sets were then merged using the simpler ```rbind```, made possible by coercing the column names of both the train and test data.frames to the same non-descriptive sequence of numbers up to the limit of number of columns.
3. The sets were given identifiers, 1 for train and 2 for test.

#### Naming variables:
1. Keeping the structure of the original dataset to be consistent with the source, the column names were loaded from features.txt and applied using the ```names``` funtion, the same was done for activity_labels.txt.
2. The only modification was to remove brackets with the 
```
      gsub("\\(\\)","",names(traintest)) 
```
function.
3. The set identifier and the activity identifier were factorized using the ```factor``` function to keep the dataset more intuitive.

#### Averages of the mean and standard deviation variables
1. I did not see a clear instruction for which "group" averages are to be calculated. I understand that two interpretations are possible and I included both of them, in distinct files for the respective tidy data:
      * By participant and by activity: The average of the variables produced by each participant, independent on the executed acitvity, and the average of the variables produced during each activity, independent on the performing participant. My personal impression is that the latter is the most relevant aggregation. I bet the experiment was carried out with several participants to obtain representative results, where the respective activity as variable of interest is to be aggregated across individuals.
      * By participant and activity: The average of the variables produced by each participant for each of the activities, allowing two groupings, by participant or by activity. I chose the latter, as I assume this to be of more importance for an analysis that does not include, e.g., a treatment attributable to participants.
2. The resulting tidy data sets have the following structure:

| aggregation level (interpretation 1)        | means                                            | standard deviations                         |
|------------------|--------------------------------------------------|---------------------------------------------|
| activity         | mean of activity, independent from subjects      | sd of activity, independent from subjects   |
| subject          | mean of activity, independent from activities    | sd of activity, independent from activities |

| aggregation level   (interpretation 2)              | means                                            | standard deviations                         |
|------------------|--------------------------------------------------|---------------------------------------------|
| activity - subject | activity mean within observations of a subject | activity sd within observatins of a subject|

3. The aggregation was performed using ```ddply```, that "splits a data frame, applies a function, and returns results in a data frame". For the first interpretation I passed as the variable to "split by" the respective activity and subject variable. The two resulting data.frames were then merged using the ```merge``` function. The distinction of the aggregation level was given in the aggregation.level column (as sketched in the table above), i.e. if a mean belongs to a activity or subject, independent of the respective second variable. For the second interpretation I passed both, activity and subject variables, to the "split by" variable to ```ddply```, which resulted in one data.frame which is considered the more relevant tidy data frame.

4. The first interpretation is stored in the csv file tidy_data1.txt, the second in tidy_data2.txt. To avoid ambiguity, priority is on the second interpretation, as it is more detailed and holds interpretation 1 in it, as a matter of an additional calculation step. However, due to the "there is no one correct answer" nature of this assignment, I left the option of having to tidy data sets.