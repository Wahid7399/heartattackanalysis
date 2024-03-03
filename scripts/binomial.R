data =  read.csv("data.csv",header = TRUE,sep = ",")

# Set the parameters
x <- sum(data$DEATH_EVENT == 1)  # Number of successes (deaths)
n <- nrow(data)  # Number of trials (total records)
p <- sum(data$DEATH_EVENT == 1)/n  # Probability of success (death)

# Calculate the probability using dbinom()
probability <- dbinom(x, n, p)


res <- c(x,n,p,probability);

print(res);