library(ggplot2)
data =  read.csv("data.csv",header = TRUE,sep = ",")
jpeg(file="G:/6/prob/project/project/public/images/ageVsEject.jpeg",
     width=750, height=350)
ggplot(data, aes(x = age, y = ejection_fraction, color = factor(DEATH_EVENT))) +
  geom_point() +
  labs(x = "Age", y = "Ejection Fraction") +
  ggtitle("Scatter plot of Age vs. Ejection Fraction")

jpeg(file="G:/6/prob/project/project/public/images/histAge.jpeg",
     width=750, height=350)
     hist(data$age)

jpeg(file="G:/6/prob/project/project/public/images/histEject.jpeg",
     width=750, height=350)    
     hist(data$ejection_fraction) 


dev.off()