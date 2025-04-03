here::i_am(
  "code/00_clean_data.R"
)

library(labelled)

# read in dataset
absolute_path_to_data <- here::here("data", 
                                    "ObesityDataSet_raw_and_data_sinthetic.csv")
data <- read.csv(absolute_path_to_data, header = TRUE)

# add labels
var_label(data) <- list(
  family_history_with_overweight = "Family history",
  FAVC = "High caloric food ",
  FCVC = "Frequency of eating vegetables",
  NCP = "Number of meals daily",
  CAEC = "Do you eat any food between meals?",
  CH2O = "Daily water consumption",
  SCC = "If monitor the calories",
  FAF = "Frequency of doing physical activity",
  TUE = "Time use technological devices",
  CALC = "Alcohol frequency",
  MTRANS = "Transportation",
  NObeyesdad = "Obesity Level"
)

# make new variables
data$number_family_history_with_overweight <- 
  ifelse(data$family_history_with_overweight == "yes", 
         "Have family history", "Don't have family history")

data$number_smoke <- ifelse(data$SMOKE == "yes", "Smoker", "Non-smoker")

data$number_H2O <- ifelse(data$CH2O < 2, "< 2", ">= 2")

saveRDS(
  data,
  file = here::here("data", "data_clean.rds")
)