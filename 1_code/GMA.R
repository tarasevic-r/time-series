par(mfrow=c(1,1))


t = seq(1:length(d1_discrete_subset$value))
t2 = seq(1:length(d2_discrete_subset$value))
# 12h , k=200
# 24h, 48h k = 250
##### GENERALIZED ADDITIVE MODELS 
#+ echo=F
if(length(t) < 100){
  k1 = 30
} else {k1=100}

if(length(t2) >= 10000){
  k2=250
}else{
  if(length(t2) > 5000){
    k2=200
  }else{k2=150}
}
# Build the model
model <- gam(value ~ s(t, k = k1, bs = 'ps'), data = d1_discrete_subset, method = "REML")
model2 <- gam(value ~ s(t2, k = k2, bs = 'ps'), data = d2_discrete_subset, method = "REML")
# coef(model)
# coef(model2)
d1_smoth = model$fitted.values
d2_smoth = model2$fitted.values

yMin = min(d1_smoth, d2_smoth) 
yMax = max(d1_smoth, d2_smoth)

plot(d1_discrete_subset$value,col ="darksalmon", type = 'l',lwd=2
     ,ylim = c(yMin, yMax)
     ,main = "1-st subset smoothed"
     ,xlab = "t"
     ,ylab = "value")
lines(model$fitted.values, col = 'darkred', lwd =3, lty = 2)

plot(d2_discrete_subset$value,col =8, type = 'l', lwd=2
     ,ylim = c(yMin, yMax)
     ,main = "2-nd subset smoothed"
     ,xlab = "t"
     ,ylab = "value")
lines(model2$fitted.values, col = 'darkred', lwd =3, lty = 2)

model_coef = data.frame(model$coefficients)
model2_coef = data.frame(model2$coefficients)
#' 
#' 
#' 
#' gam.check(model)
# model$family
#'
# 
# dat = cbind(d1_discrete_subset, t)
# 
# y = d1_discrete_subset$value
# x = t
# Sample_data = data.frame(d1_discrete_subset$value, t)
# colnames(Sample_data) = c("y","x")
# gam_y <- gam(y ~ s(x, k=20), method = "REML")
# 
# x_new <- seq(0, max(t), length.out = 100)
# y_pred <- predict(model, data.frame(x = x_new))
# ggplot(Sample_data, aes(x, y)) + geom_point() + geom_smooth(method = "gam", formula = y ~s(x, k=20))
# 
# par(mfrow = c(1,1))
#' 
#' gam.check(gam_y)
#' 
#' summary(gam_y)
#' 
#' 
#' model_matrix <- predict(gam_y, type = "lpmatrix")
#' 
#' plot(y ~ x)
#' abline(h = 0)
#' 
#' x_new <- seq(0, max(x), length.out = 100)
#' y_pred <- predict(gam_y, data.frame(x = x_new))
#' 
#' #' each of those dotted lines represent a functoin $b_{ij}$ for which GAM
#' #' estimates coefficients $\beta_{j}$. When you sum them, you get a $f(x)$
#' matplot(x, model_matrix[,-1], type = "l", lty = 2, add = T, lwd =1)
#' lines(y_pred ~ x_new, col = "red", lwd = 3)
#' 
#' plot(gam_y, shade = T)
#' 
#' x_sin_smooth <- smoothCon(s(x), data = data.frame(x), absorb.cons = TRUE)
#' X <- x_sin_smooth[[1]]$X
#' 
#' par(mfrow = c(1,2))
#' matplot(x, X, type = "l", main = "smoothCon()")
#' matplot(x, model_matrix[,-1], type = "l", main = "predict(gam_y)")
#' 
#' 
#' # beta coef (parameter estimates)
#' beta <- gam_y$coefficients
#' 
#' linear_pred <- model_matrix %*% betas
#' 
#' 
#' predict(gam_y)