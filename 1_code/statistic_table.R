# statistic calculation
stat_sub_1 = statistics_function(d1_subset$value, d1_subset$timestamp)
stat_sub_2 = statistics_function(d2_subset$value, d2_subset$timestamp)
stat_d1 = statistics_function(d1$value, d1$timestamp)
stat_d2 = statistics_function(d2$value, d2$timestamp)

stat = rbind(stat_sub_1, stat_sub_2, stat_d1, stat_d2)
row.names(stat) = c("sub 1", "sub 2"
                    , "raw 1", "raw 2")


