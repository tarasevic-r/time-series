
x1 = c(1:length(d1_discrete_subset$value))
y1 = d1_discrete_subset$value

x2 = c(1:length(d2_discrete_subset$value))
y2 = d2_discrete_subset$value

model_1 = lm(y1~x1)
model_2 = lm(y2~x2)

# par(mfrow=c(1,1))
plot(x1,y1, col = "darkgrey", main = "1-st subset regression"
     , xlab = "time", ylab = "value", type = 'l')
abline(model_1, col = 'orange', lwd = 2)

plot(x2,y2, col = "darkseagreen4", main = "2-nd subset regression"
     , xlab = "time", ylab = "value", type = 'l')
abline(model_2, col = 'blue', lwd = 2)

#+ echo=FALSE

cat(
  "\n1-st subset regression coefficients:", "\n",
  "a = ", model_1$coefficients[[1]],'\n'
  ,"b = ", model_1$coefficients[[2]], '\n')
cat(
  "\n2-nd subset regression coefficients:", "\n",
  "a = ", model_2$coefficients[[1]], '\n'
  ,"b = ", model_2$coefficients[[2]])
