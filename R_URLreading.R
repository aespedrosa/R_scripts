
setwd("C:\\Users\\aepedrosa\\Documents")
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url=url,destfile = "data.csv")
dataset <- read.csv("data.csv")
nomes <-names(dataset)
nomes_splitted<-strsplit(nomes, "wgtp")



url_q2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url=url_q2,destfile = "data_q2.csv")
dataset_q2 <- read.csv("data_q2.csv")


 values <- dataset_q2[["X.3"]]
 values <- as.character(values[5:235])
 values <- gsub(",","",values)
 values <- gsub("^ ","",values)
 values <- gsub(" $","",values)
 values <- gsub("^\.","-999",values)