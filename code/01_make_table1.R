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

# create summary table  
table_one <- data |>
  select("NObeyesdad", "Height", "NCP", 
         "number_family_history_with_overweight",
         "number_H2O", "number_smoke") |>
  tbl_summary(by = number_H2O) |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Water consumption daily in liter**") |>
  add_overall() 


# Save the table as a rds file using saveRDS()
saveRDS(
  table_one,
  file = here::here("tables/table_one.rds")
)