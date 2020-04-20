# load packages and user functions
#+ echo=F
library("tidyverse")
library("caret")
library("dplyr")
library("rhdf5")
library("zoo")
library("knitr")
library("kableExtra")
library("mgcv")
library("plotly")

# user functions 
source("user_function.R")

#+ echo=F, message=F
cat("\n_____________________ \n
ALL PACKAGES LOADED
    \n_____________________\n")