#' ---
#' title: "Time series"
#' author: "Robert Tarasevic"
#' date: "2020-04-06"
#' output:
#'     html_document:
#'         toc: true
#'         toc_depth: 2
#' ---
#' \pagebreak

#'
#' ## Load data
#'
#+ echo = F, message = F
source("packages.R")

sensor_id_1 <- 'T7_800_R6292' # define 1st sensor
sensor_id_2 <- 'T7_800_R6292' # define 2nd sensor



#' Define period for vector **to learn** in first signal 
period_start_1 <- "2019-02-12 03:38:00" # YYYY-MM-DD hh:mm:ss
period_end_1 <- "2019-02-12 03:46:00" # YYYY-MM-DD hh:mm:ss

#' Define period from second signal where to **find learned** signal
period_start_2 <- "2019-02-24 12:00:00" # YYYY-MM-DD hh:mm:ss
period_end_2 <- "2019-02-24 20:00:00" # YYYY-MM-DD hh:mm:ss

step_size = 4 # step size for discretization in seconds
#+ echo = FALSE
same_period = F # T for same period measuring
# Load data
plot = FALSE
# echo=F, message=F
source("load_rhdf5.R")

#' \pagebreak
#' ## Chosen time period for signals
#' 

#+ echo = FALSE, fig.height = 3
source("plot-subset.R")

#' \pagebreak
#' ## Statistics table
#+ echo = FALSE
source("statistic_table.R")

DT::datatable(stat, caption = "Statistics table" ) 

#' ### Some statistics explained:  
#' **Signal length - ** *Data points number in signal*  
#' **Time mode - ** *Mode of time change frequency*  
#' **Value mode - ** *Most frequent value*  
#' **Sd - ** *Standard deviation*  
#' **Mean - ** *Average value*  
#' **n5, n25, n75, n95 - ** *Quantile values*  
#' **Kurtosis - ** *Kurtosis quantifies the peak value of the PDF (positive kurtosis tells that there is lot of data in tails, negative - little data in tails*  
#' **Skewness - ** *Skewness quantifies the asymmetry behavior of vibration signal through its PDF*  
#' **RMS - ** *Root mean square value changes faster then mean*  
#' **Entropy - ** *Amount of uncertainty in an entire probability distribution*  
#' **Crest factor (cf) - ** *Ratio of the instantaneous peak amplitude of a waveform, to its root mean square RMS value*  
#' **Shape factor (sf) - ** *Shape factor is a value that is affected by an object's shape but is independent of its dimensions*    
#' **Mean crossing - ** *Mean value crossing count*
#' 
#' ***
#' 
#' 
#' ## Data discretization 
#' 
#' **Data was discretized every `r step_size` seconds**

#+ echo=F, fig.height = 3
source("discretize.R")
#'
#' ***
#'
#' ## Generalized Additive Model
#+ echo=F
source("GMA.R")
#'
#' Generalized additive model formula:  
#' 
#' * $g(E(Y)) = \beta_{0} + f_{1}(x_{1}) + f_{2}(x_{2}) + \cdots + f_{m}(x_{m}) + \varepsilon$  
#'     - $x_{1}, x_{2}, \dots, x_{m}$ - are independent variables  
#'     - $\beta_{0}$ - is an intercept  
#'     - $f_{1}, f_{2}, \dots, f_{m}$ - are unknow smooth functions (splines)  
#'     - $\varepsilon$ - is an random error 
#'   
#'  ***
#'  
#' In our case formula is :  
#' 
#' * $g(E(Y)) = \beta_{0} + f_{1}(x_{1}) + \varepsilon$,  
#' 
#'     - $f(x_{1})=\sum_{j=1}^{k}b_{j}(x_{1}) \beta_{j}$,  
#'     - $b_{j}(x_{1}) \beta_{j}$ - smooth spline function.
#' 
#'   
#' 
#' 
#+ echo=F
# knitr::kable(cbind(round(model_coef,3),round(model2_coef,3))
#              , caption = "Generalized additive method coefficients" )


#' 
#' ***
#'
#' \pagebreak 

#+ echo = FALSE, fig.height=3
# par(mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
# plot(d1_discrete_subset$value
#      ,xlim = c(0, max(length(d1_discrete_subset$value), length(d2_discrete_subset$value)))
#      ,ylim = c(min(d1_discrete_subset$value, d2_discrete_subset$value), max(d1_discrete_subset$value, d2_discrete_subset$value))
#      ,main = "original subsets"
#      ,xlab = "t"
#      ,ylab = "value"
#      ,type = 'l'
#      ,col = "darkred", lwd = 1)
# lines(d2_discrete_subset$value, col= "blue", lwd=1, lty=2 )
# legend("topright", inset=c(-0.35,0), legend=c("subset 1", "subset 2"),
#        col=c("darkred", "blue"), lty=1:2, lwd=1)

# 
# par(mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
# plot(model$fitted.values, type = 'l'
#      , col = "darkred"
#      ,xlim = c(0, (max(length(t), length(t2)))+10)
#      ,ylim = c(min(model$fitted.values, model2$fitted.values)
#                ,(max(max(model$fitted.values), max(model2$fitted.values))))
#      ,lwd = 2
#      ,main = "approximated subsets"
#      ,xlab = "t"
#      ,ylab = "value")
# lines(model2$fitted.values, col='blue', lty = 2, lwd = 2)
# legend("topright", inset=c(-0.35,0), legend=c("subset 1", "subset 2"),
#        col=c("darkred", "blue"), lty=1:2, lwd=2)
#'
#' ***
#' 

#+ echo=F
# len_model = min(length(model$fitted.values), length(model2$fitted.values))
# cor(model$fitted.values[1:len_model], model2$fitted.values[1:len_model])
par(mfrow=c(1,1))


#' \pagebreak
#' ## Correlation
#+ echo=FALSE, message = F
source("auto-correlation.R")
#+ echo=F, message=F, out.width = "120%", out.height = "100%"
fig
#+ echo=F, message=F
DT::datatable(results, style = "bootstrap")
#+ echo=F
## create a chart for original data with `plotly`
  # plotly::plot_ly(
  #   x = d1$timestamp
  #   , y = d1$value
  #   , type = 'scatter'
  #   , mode = 'lines'
  # )

# 
# plot(normalize(model$fitted.values), type = 'l')
# lines(normalize(model2$fitted.values), col = 4, lty=2)
