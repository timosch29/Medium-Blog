
# set seed for reproducibility
set.seed(123)

# make 100 standard normal distributed data points
x <- rnorm(100)

# calcualte density 
fit <- density(x)

library("plotly")

# plot histogram and density of data
p1<- plot_ly(x = x, type = "histogram", name = "Histogram") %>% 
            add_trace(x = fit$x, y = fit$y, type = "scatter", mode = "lines", fill = "tozeroy", yaxis = "y2", name = "Density", alpha=0.4) %>% 
            layout(yaxis2 = list(overlaying = "y", side = "right"))  %>% 
            layout(title= "Data with Standard Normal Distribution \n µ = 0 and  σ = 1") %>% 
            hide_legend()
            

# make 1000 standard normal distributed data points
x_2 <- rnorm(100, mean=15, sd=5.5)

# calcualte density 
fit_2 <- density(x_2)


# plot histogram and density of data
p2<- plot_ly(x = x_2, type = "histogram", name = "Histogram") %>% 
            add_trace(x = fit_2$x, y = fit_2$y, type = "scatter", mode = "lines", fill = "tozeroy", yaxis = "y2", name = "Density", alpha=0.4) %>% 
            layout(yaxis2 = list(overlaying = "y", side = "right"))  %>% 
            layout(title= "Data with Normal Distribution \n µ = 15 and  σ = 5.5") %>% 
            hide_legend()

#subplot(p1, p2, shareX =TRUE, shareY = TRUE, which_layout = 2)

crosstalk::bscols(p1,p2)

