# Load the necessary library
library(dplyr)

# Read the CSV file into a data frame
dataset <- read.csv("dataset.csv")

# Check the structure of the dataset
str(dataset)

# Calculate BMI
calculate_bmi <- function(height, weight)  {
  # Convert height from inches to meters and weight from pounds to kg.
  bmi <- (weight*0.45359237) / ((height*2.51 / 100)^2)
  return(bmi) 
}

# Apply the calculate_bmi function to the dataset
dataset <- dataset %>% mutate(BMI = calculate_bmi(dataset$Height.Inches., dataset$Weight.Pounds.))

# Display the updated dataset with BMI
print(dataset)

# Save the updated dataset with BMI to a new CSV file
write.csv(dataset, "dataset_with_bmi.csv", row.names = FALSE)