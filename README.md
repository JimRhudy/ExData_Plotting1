This document will highlight steps taken to complete the first project associated with the Exploratory Data Analysis MOOC hosted by Johns Hopkins University. The assignment specifications are found in the original README posted in the repo I forked for this assignment. The data source is linked within that document. Data documentation is found here: http://archive.ics.uci.edu/ml/index.php.
The repo includes four .R script files and four plots in .PNG files. Each script can be run to construct its associated plot. The reader will need to edit the file path for his/her own computing environment.
Briefly, I downloaded and unzipped the data to the project directory;  loaded packages as needed; set the working directory in the tool bar; unzipped the data, read it in, and undertook the following steps:
•	Converted the Date variable for analysis 
•	Filtered data to the rows of interest for the two day study period
•	Mutated a Weekday column to facilitate preprocessing of Time data
•	Converted the Time variable to class “period”
•	Added 24 hours to each Friday row using ifelse() within mutate()
With the data preprocessed in this manner, I undertook creation of the four plots as specified in the assignment and uploaded to my repo.




