# Load the Titanic dataset
data <- read.csv("Titanic-Dataset.csv")
data  # Display the dataset

# Install and load required package
install.packages("caTools")
library(caTools)

# Set seed for reproducibility
set.seed(2025)

# Split the data into training (70%) and testing (30%) sets
split <- sample.split(data$Survived, SplitRatio = 0.7)

# Create training and testing datasets based on the split
training_data <- subset(data, split == TRUE)
testing_data <- subset(data, split == FALSE)

# Print the training and testing datasets
training_data
testing_data

# Train a logistic regression model using the training dataset
model <- glm(Survived ~ ., data = training_data, family = binomial)

# Display model summary
summary(model)

# Make predictions on the testing dataset
predicted_model <- predict(model, data = testing_data , type = "response")
predicted_model

# Convert predicted probabilities into binary outcomes (0 or 1)
predictions_binary <- ifelse(predicted_model > 0.5, 1, 0)

# Print the binary predictions
predictions_binary
