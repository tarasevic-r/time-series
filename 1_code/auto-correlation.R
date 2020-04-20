dw = length(d1_smoth)
from = 1
to = dw
i=1

cor_rezult = data.frame()
while(to < length(d2_smoth)){
  # cat("\n",i,"/",(length(d2_smoth)-dw), "\n")
  
  cor_rezult = rbind(cor_rezult, cor(d1_smoth, d2_smoth[from:to]))
  
  from = from + 1
  to = to + 1
  i=i+1
}
cor_rezult = round(cor_rezult,2)
colnames(cor_rezult) = "correlation"
time_start = d2_discrete_subset$timestamp[1:(length(d2_discrete_subset$timestamp)-dw)]
time_end = time_start + dw*step_size

low = which(abs(cor_rezult) < 0.85)
cor_rezult[low,] = 0

results = cbind("time start" = as.character(time_start), "time end" = as.character(time_end), cor_rezult)
# plot(cor_rezult[,1], type = 'h')
# one = which(cor_rezult < -0.8)
# two = which(cor_rezult >= -0.8 & cor_rezult < -0.5 )
# three = which(cor_rezult >= 0.5 & cor_rezult < 0.8 )
# four = which(cor_rezult >= 0.8)

x = d2_discrete_subset$timestamp[1:(length(d2_discrete_subset$timestamp)-dw)]
# y = d2_discrete_subset$value[1:(length(d2_discrete_subset$value)-dw)]
y = d2_smoth[1:(length(d2_smoth)-dw)]





ay <- list(
  tickfont = list(color = "red"),
  overlaying = "y",
  side = "right",
  title = "second y axis"
)
fig <- plot_ly()
fig <- fig %>% add_lines(x = x, y = y
                        , name = "smothed signal")
fig <- fig %>% add_bars(x = x, y = cor_rezult[,1]
                        , size = abs(cor_rezult[,1])
                        , sizes = c(0,0.1)
                        , name = "correlation", yaxis = "y2") 

fig <- fig %>% layout(
  title = "Double Y Axis", yaxis2 = ay,
  xaxis = list(title="time")
)

fig
