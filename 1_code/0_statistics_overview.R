# statistic table
stat_d1 = statistics_function(d1$value, d1$timestamp)
stat_d2 = statistics_function(d2$value, d2$timestamp)

statistika = rbind(stat_d1, stat_d2)
row.names(statistika) = c("sensor 1", "sensor 2")

stat = DT::datatable(statistika)

print(stat)


cat("\n______________________________ \n
RAW SIGNALS STATISTICS ---->
    \n______________________________\n")
