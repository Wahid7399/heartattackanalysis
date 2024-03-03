library(ggplot2)
data =  read.csv("data.csv",header = TRUE,sep = ",")
jpeg(file="G:/6/prob/project/project/public/images/PlatelestVsSerum.jpeg",
     width=750, height=350)
ggplot(data, aes(x = platelets, y = serum_creatinine, color = factor(DEATH_EVENT))) +
  geom_point() +
  labs(x = "Platelets", y = "Serum Creatinine", title = "Scatterplot of Platelets vs. Serum Creatinine") +
  scale_color_manual(values = c("skyblue", "salmon"), labels = c("Survived", "Deceased"))

jpeg(file="G:/6/prob/project/project/public/images/platelets.jpeg",
     width=750, height=350)
     hist(data$platelets)

jpeg(file="G:/6/prob/project/project/public/images/serum.jpeg",
     width=750, height=350)
     hist(data$serum_creatinine)


dev.off()