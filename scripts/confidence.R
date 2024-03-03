x <- function(d) {
  # Load the data from a CSV file
  library(jsonlite)
  data <- read.csv("data.csv", header = TRUE, sep = ",")
  confidence_intervals <- lapply(data, function(x) t.test(x)$conf.int)



#   return(c(age,creatinine_phosphokinase,ejection_fraction,platelets,serum_creatinine,time))
  return(toJSON(confidence_intervals))
}
