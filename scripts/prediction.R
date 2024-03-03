x <- function(a, t, ef, sc) {
  # Load the data from a CSV file
  dat <- read.csv("data.csv", header = TRUE, sep = ",")
  
  # Create a data frame with the desired independent variables and the dependent variable
  data <- data.frame(
    age = dat$age,
    time = dat$time,
    ejection_fraction = dat$ejection_fraction,
    serum_creatinine = dat$serum_creatinine,
    DEATH_EVENT = dat$DEATH_EVENT
  )
  
  # Perform multiple linear regression
  model <- lm(DEATH_EVENT ~ age + time + ejection_fraction + serum_creatinine, data = data)
  
  # Create a new data frame with the input variables
  new_data <- data.frame(
    age = as.numeric(a),
    time = as.numeric(t),
    ejection_fraction = as.numeric(ef),
    serum_creatinine = as.numeric(sc)
  )
  
  # Use the predict function to make predictions on the new data
  predictions <- predict(model, newdata = new_data)
  
  # Return the predictions
  return(predictions)
}
