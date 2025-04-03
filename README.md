# Obesity Levels Analysis

> Carina Fu

------------------------------------------------------------------------

# Code Description

`code/00_clean_data.R`
- read in data set, label and create some new variables
- save data as a `.rds` object in `data/` folder

`code/01_make_table1.R`
- make summary table
- saves tables as a `.png` object in `tables/` folder

`code/02_make_plots.R`
- make bar plot and scatter plot
- saves the two plots as `.png` objects in `plots/` folder

`code/03_render_report.R`
- renders `report.Rmd`

`report.Rmd`
- loads data sets saved by the `.R` scripts
- makes table and plots of each

`Makefile`
- contains rules for building the report

------------------------------------------------------------------------

# Generate the final report

Use make and make clean to generate the final report.

------------------------------------------------------------------------

# Introduction

This dataset includes comprehensive data for the estimation of obesity levels 
in individuals from the countries of Mexico, Peru, and Colombia, providing 
valuable insights based on various factors such as their eating habits, 
physical condition, lifestyle choices, and other health-related behaviors. 
The information collected aims to offer a deeper understanding of the 
prevalence of obesity in these regions, potentially aiding in the development 
of tailored public health interventions and policies to combat obesity and 
improve overall health outcomes across these nations.

The dataset consists of 17 attributes and 2,111 records, each labeled with the 
class variable "NObesity" (Obesity Level), which enables the classification of 
data into categories such as Insufficient Weight, Normal Weight, Overweight 
Level I, Overweight Level II, Obesity Type I, Obesity Type II, 
and Obesity Type III. 

**Mass body index** = $\frac{weight}{height*height}$

Underweight refers to people whose mass body weight index is less 
than 18.5. Normal weight people have a mass body weight index of 
18.5 to 24.9, Overweight people have a mass body weight index of 25 to 29.9, 
Obesity I 30.0 to 34.9, Obesity II 35.0 to 39.9, and Obesity III Higher than 40.

------------------------------------------------------------------------

# Descriptive Analysis

1. A table has been made to summarizes the relationship between 
obesity level and daily water intake. At the same time, the table also gives 
the median height and the median number of meals eaten per day. 
It summarizes the data on daily water intake for people with or without a 
family history of obesity and whether they smoke and their daily water intake.

2. A bar plot has been made to illustrate the distribution of obesity levels in 
the dataset.

3. A scatter plot of NCP(number of main meals) as a function of number of 
Height has been made to find out whether taller people eat more meals per day.