
library("plotly")

# set seed for reproducibility
set.seed(11*59)

# make 1000 standard normal distributed data points
data <- data.frame(values = rnorm(1000))

library("fGarch")
# make 1000 standard normal distributed data points with right skew
data <- data.frame(values= rsnorm(1000, mean = 0, sd = 1, xi = 10))

# make 1000 standard normal distributed data points with left skew
data <- data.frame(values= rsnorm(1000, mean = 0, sd = 1, xi = -10))

library("LambertW")
# make 1000 standard normal distributed data points with heavy tails
data <- data.frame(values= rLambertW(n=1000, distname = "normal", beta = c(0,3), delta = 0.2))

# make 1000 standard normal distributed data points with light tails
data <- data.frame(values= rLambertW(n=1000, distname = "normal", beta = c(0,2), delta =-0.2))

# calcualte density 
density_data <- density(data$values)

# make interactive density plot
p1 <- plot_ly(x = ~density_data$x, y = ~density_data$y, type = 'scatter', mode = 'lines', fill = 'tozeroy') %>%
            layout(
                   title= "Density of normally distributed data",
                   
                   xaxis = list(title = 'Value'),
                   yaxis = list(title = 'Density'))

library("qqplotr")
# make interactive qqplot
p2<- ggplotly(
            ggplot(data, mapping = aes(sample = values)) +
            stat_qq_band() +
            stat_qq_line() +
            stat_qq_point() +
            labs(x = "Theoretical Quantiles", y = "Sample Quantiles", title= "Corresponding QQ-plot"),
            
            dynamicTicks=TRUE)

# arraging plots together
crosstalk::bscols(p1,p2)

# Kolmogorov-Smirnov Test for normality
ks.test(data$values, y="pnorm") 

# as p >> 0.05 here, it is very unlikely that our distribution is different from a normal distribution


