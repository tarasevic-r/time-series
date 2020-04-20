#' First signal subset starts and end period:
#+ echo = FALSE

#### subset ####
d1_subset <- subset(d1, d1$timestamp > period_start_1
                    & d1$timestamp < period_end_1)

d2_subset <- subset(d2, d2$timestamp > period_start_2
                    & d2$timestamp < period_end_2)

# #+ echo = FALSE
# cat("First signal subset: ",period_start_1, "-", period_end_1, '\n')

#' Both signals subsets graph
#+ echo = FALSE
plot(x = d1_subset$timestamp, d1_subset$value
     ,main = paste(sensor_id_1,'\n', period_start_1, '-', period_end_1)
     ,xlab = "time"
     ,ylab = "value"
     ,type = 'l')

#' ***

#' Second signal subset starts and end period:
#+ echo = FALSE
# cat("Second signal subset: ", period_start_2, "-", period_end_2, '\n')

plot(x = d2_subset$timestamp, d2_subset$value
     ,main = paste(sensor_id_2,'\n', period_start_2, '-', period_end_2)
     ,xlab = "time"
     ,ylab = "value"
     ,type = 'l')

# 
# plotly::plot_ly(
#         x = d2_subset$timestamp
#         , y = d2_subset$value
#         , type = 'scatter'
#         , mode = 'lines'
# )
