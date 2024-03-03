data =  read.csv("data.csv",header = TRUE,sep = ",")
library(jsonlite)
summary <- list(
  table_data =(summary(data$age))
)

summary$table_data <- as.list(summary$table_data)
Age= toJSON(summary)
# write(Age, "age.json")

summary <- list(
  table_data =(summary(data$ejection_fraction))
)
summary$table_data <- as.list(summary$table_data)
ejection_fraction= toJSON(summary)
# write(ejection_fraction, "ejection_fraction.json")


summary <- list(
  table_data =(summary(data$creatinine_phosphokinase))
)
summary$table_data <- as.list(summary$table_data)
creatinine_phosphokinase= toJSON(summary)
# write(creatinine_phosphokinase, "creatinine_phosphokinase.json")


summary <- list(
  table_data =(summary(data$platelets))
)
summary$table_data <- as.list(summary$table_data)
platelets= toJSON(summary)
# write(platelets, "platelets.json")

summary <- list(
  table_data =(summary(data$serum_sodium))
)
summary$table_data <- as.list(summary$table_data)
serum_sodium= toJSON(summary)
# write(serum_sodium, "serum_sodium.json")
summary <- list(
  table_data =(summary(data$serum_creatinine))
)
summary$table_data <- as.list(summary$table_data)
serum_creatinine= toJSON(summary)
# write(serum_creatinine, "serum_creatinine.json")

json_data<-list(
a=Age,
ef=ejection_fraction,
cp=creatinine_phosphokinase,
p=platelets,
ss=serum_sodium,
sc=serum_creatinine
)
write(toJSON(json_data), "a1.json")


print("")

