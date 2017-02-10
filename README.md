# CleaningDataProjectR
Coursera's final project for Getting &amp; Cleaning data module

The purpose of this project is to produce a clean & tiny data from the dataset located on:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

It is composed of a single R script that performs the following steps:

- Downloads the file containing the dataset
- Unzips the file
- Because there are two different dataset (test & train) it combines them on a single dataset
- Cleans out the columms of the dataset that are not related to means & standar deviations. It also keeps track of the Activity name & the subject of the observation.
- Aggregates the dataset, grouping the data by Activity & subject.
- Writes the data set to a file called "tinyData.txt".
- Removes the folder that was created by the ZIP file.
