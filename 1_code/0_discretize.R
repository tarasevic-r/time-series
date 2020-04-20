# signal discretization
step_size = statistika$t_mode[1] # discretization step in seconds based on time mode calculated above

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



cat("\n_____________________________________________ \n
SIGNALS WERE DISCRETIZED EVERY", step_size, "seconds",
    "\n_____________________________________________\n")
