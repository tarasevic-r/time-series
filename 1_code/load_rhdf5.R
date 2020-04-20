# Load rhdf5 file


## load data to a data frame
d1 <-
  rhdf5::h5read(
    paste0("../2_raw-data/", sensor_id_1, ".H5")
    , "/promc.dataset.orig"
    , bit64conversion="double"
  )

d2 <-
  rhdf5::h5read(
    paste0("../2_raw-data/", sensor_id_2, ".H5")
    , "/promc.dataset.orig"
    , bit64conversion="double"
  )



### Format Data ####

## Round value to integer

# d1$value <- log(d1$value)
# d2$value <- log(d2$value)
d1$value <- as.integer(d1$value)
d2$value <- as.integer(d2$value)



## Convert timestamp to date-time

suppressPackageStartupMessages(
  library('lubridate') # time series processing
)

d1$timestamp <-
  lubridate::as_datetime(
    as.numeric(d1$timestamp/1000000)
    , tz = "Asia/Yekaterinburg" # "GMT-3"
  )

d2$timestamp <-
  lubridate::as_datetime(
    as.numeric(d2$timestamp/1000000)
    , tz = "Asia/Yekaterinburg" # "GMT-3"
  )
# 

if(plot == TRUE){
  #### Plot ####
  # Plot first signal graph
  plot(x=d1$timestamp, y=d1$value, type='l'
       ,main = sensor_id_1
       ,xlab = "Time"
       ,ylab = "value")
  
  if(sensor_id_1 != sensor_id_2){
    
    plot(x = d2$timestamp, y = d2$value, type='l'
         ,main = sensor_id_2
         ,xlab = "Time"
         ,ylab = "value")
  } else{
    print("Only one graph showed because same sensor chosen")
  }
}