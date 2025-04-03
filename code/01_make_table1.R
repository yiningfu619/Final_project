here::i_am(
  "code/01_make_table1.R"
)

data <- readRDS(
  file = here::here("data/data_clean.rds")
)

# Tabular analysis

# Load libraries
library(here)
library(dplyr)
library(gtsummary)
library(gt) 

# create summary table  
table_one <- data |>
  select("NObeyesdad", "Height", "NCP", 
         "number_family_history_with_overweight",
         "number_H2O", "number_smoke") |>
  tbl_summary(by = number_H2O) |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Water consumption daily in liter**") |>
  add_overall() 

# Convert the gtsummary object to a gt table
table_one_gt <- as_gt(table_one)

# Save the table as a PNG file using gtsave()
gtsave(
  table_one_gt,
  filename = here::here("tables/table_one.png")
)