checkin <- read.csv("checkin_test.csv", stringsAsFactors = FALSE)
checkin <- checkin[c("business_id",
  paste("checkin_info", rep(0:23, times = 7), rep(0:6, each = 24), sep = "."))]
names(checkin) <- c("business_id", 
  paste(rep(0:23, times = 7), rep(0:6, each = 24), sep = "-"))
checkin[is.na(checkin)] <- 0

checkin$weekday_breakfast <- apply((checkin[,
  paste(rep(5:10, times = 5), rep(1:5, each = 6), sep = "-")]), 1, sum)
checkin$weekday_lunch <- apply((checkin[,
  paste(rep(11:16, times = 5), rep(1:5, each = 6), sep = "-")]), 1, sum)
checkin$weekday_dinner <- apply((checkin[,
  paste(rep(17:22, times = 5), rep(1:5, each = 6), sep = "-")]), 1, sum)
checkin$weekday_other <- apply((checkin[,
  paste(rep(c(0:4, 23), times = 5), rep(1:5, each = 6), sep = "-")]), 1, sum)
checkin$weekend_breakfast <- apply((checkin[,
  paste(rep(5:10, times = 2), rep(c(0, 6), each = 6), sep = "-")]), 1, sum)
checkin$weekend_lunch <- apply((checkin[,
  paste(rep(11:16, times = 2), rep(c(0, 6), each = 6), sep = "-")]), 1, sum)
checkin$weekend_dinner <- apply((checkin[,
  paste(rep(17:22, times = 2), rep(c(0, 6), each = 6), sep = "-")]), 1, sum)
checkin$weekend_other <- apply((checkin[,
  paste(rep(c(0:4, 23), times = 2), rep(c(0, 6), each = 6), sep = "-")]), 1, sum)

checkin_clean <- checkin[c("business_id",
  paste(rep(c("weekday", "weekend"), each = 4),
        rep(c("breakfast", "lunch", "dinner", "other"), times = 2), sep = "_"))]

rm("checkin")
