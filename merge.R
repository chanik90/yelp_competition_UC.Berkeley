require(readr)

source("checkin.R")
business_clean <- read_csv("clean_business.csv")
reviews_clean <- read_csv("new_review.csv")

business_clean <- business_clean[business_clean$open == TRUE,
  order(apply(is.na(business_clean), 2, sum))[1:46]]
business_clean$"[EMPTY]" <- NULL
business_clean$open <- NULL

merged <- merge(business_clean, checkin_clean, by = "business_id")
merged <- merge(merged, reviews_clean, by = "business_id")

write.csv(merged, file = "merged.csv")
