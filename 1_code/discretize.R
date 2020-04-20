
# discretize 1
# discretize 1-st signal
test = zoo::zoo(d1$value, d1$timestamp)
tt = seq(start(test), end(test), by = step_size) # every 4 sec
d1_discrete = zoo::na.locf(merge(test, zoo::zoo(order.by = tt)))

# discretize 2-nd signal
if(sensor_id_1 != sensor_id_2){
  test2 = zoo::zoo(d2$value, d2$timestamp)
  tt2 = seq(start(test2), end(test2), by = step_size) # every 4 sec
  d2_discrete = zoo::na.locf(merge(test2, zoo::zoo(order.by = tt2)))
} else{
  d2_discrete = d1_discrete
}

# converte to data frame
d1_discrete = zoo::fortify.zoo(d1_discrete)
colnames(d1_discrete) = c("timestamp", "value")
d2_discrete = zoo::fortify.zoo(d2_discrete)
colnames(d2_discrete) = c("timestamp", "value")


# discretized data


#### Plot ####
# Plot first signal graph
# plot(x=d1_discrete$timestamp, y=d1_discrete$value, type='l'
#      ,main = paste("discretized", "signal:", sensor_id_1)
#      ,xlab = "time"
#      ,ylab = "value")
# 
# if(sensor_id_1 != sensor_id_2){
#   
#   plot(x = d2_discrete$timestamp, y = d2_discrete$value, type='l'
#        ,main = paste("discretized", "signal:", sensor_id_2)
#        ,xlab = "time"
#        ,ylab = "value")
# } else{
#   print("Only one graph showed because same sensor chosen")
# }

#### discretized data subset ####
d1_discrete_subset <- subset(d1_discrete, d1_discrete$timestamp > period_start_1
                             & d1_discrete$timestamp < period_end_1)

d2_discrete_subset <- subset(d2_discrete, d2_discrete$timestamp > period_start_2
                             & d2_discrete$timestamp < period_end_2)



#discretize 1-st signal
test = zoo::zoo(d1$value, d1$timestamp)
tt = seq(start(test), end(test), by = step_size) # every 4 sec
d1_discrete = zoo::na.locf(merge(test, zoo::zoo(order.by = tt)))

# discretize 2-nd signal
if(sensor_id_1 != sensor_id_2){
  test2 = zoo::zoo(d2$value, d2$timestamp)
  tt2 = seq(start(test2), end(test2), by = step_size) # every 4 sec
  d2_discrete = zoo::na.locf(merge(test2, zoo::zoo(order.by = tt2)))
} else{
  d2_discrete = d1_discrete
}

# converte to data frame
d1_discrete = zoo::fortify.zoo(d1_discrete)
colnames(d1_discrete) = c("timestamp", "value")
d2_discrete = zoo::fortify.zoo(d2_discrete)
colnames(d2_discrete) = c("timestamp", "value")


# discretized data


#### Plot ####
# Plot first signal graph
# plot(x=d1_discrete$timestamp, y=d1_discrete$value, type='l'
#      ,main = paste("discretized", "signal:", sensor_id_1)
#      ,xlab = "time"
#      ,ylab = "value")
# 
# if(sensor_id_1 != sensor_id_2){
#   
#   plot(x = d2_discrete$timestamp, y = d2_discrete$value, type='l'
#        ,main = paste("discretized", "signal:", sensor_id_2)
#        ,xlab = "time"
#        ,ylab = "value")
# } else{
#   print("Only one graph showed because same sensor chosen")
# }

#### discretized data subset ####
d1_discrete_subset <- subset(d1_discrete, d1_discrete$timestamp > period_start_1
                             & d1_discrete$timestamp < period_end_1)

d2_discrete_subset <- subset(d2_discrete, d2_discrete$timestamp > period_start_2
                             & d2_discrete$timestamp < period_end_2)



#plot subsets
#' ***
#+ echo = FALSE
# cat("First signal subset: ",period_start_1, "-", period_end_1, '\n')

#' Both signals subsets graph
#+ echo = FALSE
plot(x = d1_discrete_subset$timestamp, d1_discrete_subset$value
     ,main = paste("discretized subset \n", sensor_id_1,'\n'
                   , period_start_1, '-', period_end_1)
     ,xlab = "time"
     ,ylab = "value"
     ,type = 'l')


#' ***

#' Second signal subset starts and end period:
#+ echo = FALSE
# cat("Second signal subset: ", period_start_2, "-", period_end_2, '\n')

plot(x = d2_discrete_subset$timestamp, d2_discrete_subset$value
     ,main = paste("discretized subset \n", sensor_id_2,'\n', 
                   period_start_2, '-', period_end_2)
     ,xlab = "time"
     ,ylab = "value"
     ,type = 'l')
