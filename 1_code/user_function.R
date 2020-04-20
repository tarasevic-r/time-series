# User functions:
# source("features_function.R")
## Normalize data using Min Max (exclude NA values)
normalize <-
  function(x, na.rm = TRUE) {
    ranx <- range(x, na.rm = na.rm)
    (x - ranx[1]) / diff(ranx)
  }
# call: normalize(x)


#### zero crossing number function ####
zero_cross <- function(signal){
  
  up_down <- c(0, diff(sign(signal)))
  ix <- which(up_down != 0)
  
  return(length(ix))
}

##### mean crossing number function ####
# signal = s
mean_cross <- function(signal){
  
  up_down <- c(0, diff(sign(mean(signal) - signal)))
  ix <- which(up_down != 0)
  
  return(length(ix))
}

##### percentils functino ####
percentils <- function(signal, prob){
  
  percentil <- data.frame(quantile(signal, probs = c(prob)))
  colnames(percentil) = NULL
  percentil <- percentil[,1]
  
  return(percentil)
}

## return top mode frequency for vector x
Mode_f <- function(x) {
  Mx <- unique(x)
  return(Mx[which.max(tabulate(match(x,Mx)))])
}

#### statistics #####
statistics_function <- function(signal, time = c(1,2)){
  data.frame(
    len = length(signal),
    t_mod = Mode_f(round(diff(time))), # time change mode
    v_mod = Mode_f(signal),
    sd = round(sd(signal), 2),
    mean = round(mean(signal), 2),
    # n5 = round(percentils(signal, 0.05), 2),
    # n25 = round(percentils(signal, 0.25), 2),
    # n75 = round(percentils(signal, 0.75), 2),
    # n95 = round(percentils(signal, 0.95), 2),
    # energie = sum(abs(signal)^2),
    kurt = round(e1071::kurtosis(signal), 2),
    skew = round(e1071::skewness(signal), 2),
    rms = round(mean(sqrt(signal^2)), 2), # root mean squared value
    # zero_crossing = zero_cross(signal),
    entropy = round(entropy::entropy.ChaoShen(signal),2),
    cf = round(max(Mod(signal)) / sqrt(1/length(signal) * sum(signal^2)),2),
    sf = round(sqrt(1/length(signal) * sum(signal^2)) / (1/length(signal) * sum(Mod(signal)) ),2), 
    mean_cros_rate = mean_cross(signal)
  )
}
