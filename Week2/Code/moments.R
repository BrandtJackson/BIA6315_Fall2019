#Let's generate a random sample:
set.seed(123)
data <- rnorm(100)
head(data)
tail(data)
hist(data)
qqnorm(data)
qqline(data, col = 2) 

#First moment: Mean (Location)
mean.manual <- sum(data)/100
print(mean.manual)
mean.automatic <- mean(data)
print(mean.automatic)

#Second moment: Variance (Spread)
variance.manual <- sum((data-mean.manual)^2)/(99)
print(variance.manual)
variance.automatic <- var(data)
print(variance.automatic)
##bonus
sigma <- sqrt(variance.manual)
print(sigma)
sd(data) #automatic approach

#Third moment: Skewness (Symmetry)
skewness.manual <- (sum((data-mean.manual)^3))/(99*sigma^3)
print(skewness.manual)
library(moments) 
skewness.automatic <- skewness(data)
print(skewness.automatic) #pretty close
#skewness > 0 indicates positive/right 
#skewness < 0 indicates negative/left

#Fourth moment: Kurtosis (Peakedness/Tails)
kurtosis.manual <- (sum((data-mean.manual)^4))/(99*sigma^4)
print(kurtosis.manual)
kurtosis.automatic <- kurtosis(data)
print(kurtosis.automatic) #pretty close again
#kurtosis > 3 indicates sharp peak/thinner tails
#kurtosis <3 indicates flatter peak/fatter tails