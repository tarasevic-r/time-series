
# Write sensor id
sensor_id_1 <- 'T7_800_R6292' # define 1st sensor id
sensor_id_2 <- 'T7_800_R6292' # define 2nd sensor id

#### Required packages ####
source("packages.R")
##### Load data ####
source("0_load_rhdf5.R")
#### Full signals statistics ####
source("0_statistics_overview.R")
#### discretiez signals ####
# source("0_discretize.R")

# plot SENSOR 1 signal to choose subset
plotly::plot_ly(
  y = d1$value
  ,x = d1$timestamp
  , type = 'scatter'
  , mode = 'lines'
)


# # plot SENSOR 2 signal to choose subset
# plotly::plot_ly(
#   y = d2$value
#   ,x = d2$timestamp
#   , type = 'scatter'
#   , mode = 'lines'
# )
# 
# 
# # Define period for first signal YYYY-MM-DD hh:mm:ss
# period_start_1 <- "2019-02-08 11:10:00"
# period_end_1 <- "2019-02-08 18:00:00"
# 
# # Define period for second signal YYYY-MM-DD hh:mm:ss
# period_start_2 <- "2019-02-06 16:00:00"
# period_end_2 <- "2019-02-07 18:00:00"