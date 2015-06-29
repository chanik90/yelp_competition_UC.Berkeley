library(cluster)

### http://www.stat.berkeley.edu/~s133/Cluster2a.html ###
########################################################################
# data = read.csv("~/Documents/Personal_Projects/yelp_proj/CSV_File/final_data.csv")
data = read.csv("~/yelp_competition_UC.Berkeley/final_data.csv")
# diss = daisy(data, metric = "gower", stand=FALSE)
# z = agnes(diss)
########################################################################

w = c(0, 1, 1, 0, rep(1, 47))
v = rep(10,3)
w = c(w,v)

data.3.1 = data[data$location==3,]
diss.3.1 = daisy(data.3.1, metric="gower", stand=FALSE, weights = w)
z.3.1 = agnes(diss.3.1)
groups.3.15.1 = cutree(z.3.1, 15)
table(groups.3.15.1)

data.3.2 = data.3.1[groups.3.15.1 == 1, ]
diss.3.2 = daisy(data.3.2, metric="gower", stand=FALSE, weights = w)
z.3.2 = agnes(diss.3.2)
groups.3.15.2 = cutree(z.3.2, 15)
table(groups.3.15.2)

group1 = data.3.2[groups.3.15.2 == 2, ]
group2 = data.3.2[groups.3.15.2 == 3, ]
group3 = data.3.2[groups.3.15.2 == 4, ]

data.3.3 = data.3.2[groups.3.15.2 == 1, ]
diss.3.3 = daisy(data.3.3, metric="gower", stand=FALSE, weights = w)
z.3.3 = agnes(diss.3.3)
groups.3.15.3 = cutree(z.3.3, 15)
table(groups.3.15.3)

group4 = data.3.3[groups.3.15.3 == 3, ]

data.3.4 = data.3.3[groups.3.15.3 == 1, ]
diss.3.4 = daisy(data.3.4, metric="gower", stand=FALSE, weights = w)
z.3.4 = agnes(diss.3.4)
groups.3.15.4 = cutree(z.3.4, 15)
table(groups.3.15.4)

group5 = data.3.4[groups.3.15.4 == 2, ]
group6 = data.3.4[groups.3.15.4 == 3, ]
group7 = data.3.4[groups.3.15.4 == 5, ]
group8 = data.3.4[groups.3.15.4 == 6, ]
