cases =  read.csv("data.csv",header = TRUE,sep = ",")
options(scipen=10000)
jpeg(file="G:/6/prob/project/project/public/images/Boxplot.jpeg",
     width=750, height=350)
boxplot((cases$age), col="grey")

jpeg(file="G:/6/prob/project/project/public/images/histogram.jpeg",
     width=750, height=350)
hist(cases$age)
dev.off()