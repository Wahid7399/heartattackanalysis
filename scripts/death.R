library(ggplot2)
data =  read.csv("data.csv",header = TRUE,sep = ",")
jpeg(file="G:/6/prob/project/project/public/images/death.jpeg",
     width=750, height=350)

ggplot(data, aes(x = factor(DEATH_EVENT), fill = factor(DEATH_EVENT))) +
  geom_bar() +
  labs(x = "Death Event", y = "Count", title = "Barplot of Death Events") +
  scale_fill_manual(values = c("skyblue", "salmon"), labels = c("Survived", "Deceased"))
dev.off()


