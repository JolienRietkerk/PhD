library(tidyverse)
library(nycflights13)

#data <- read.table(pheontype file)

data <- mutate(data, setnumber=rep_len(c(1:10),nrow(data)))

for (i in 1:10) {
  assign(paste("training", i, sep=""), filter(data, setnumber!= i)[,-ncol(data)])
  assign(paste("test",i, sep=""), filter(data, setnumber== i)[,-ncol(data)])
}


for (i in 1:10) {
  training <- data.frame(filter(data,setnumber != i)[,-ncol(data)])
  trainfile <- file.path(paste0("~/Desktop/training", i , ".txt"))
  write.table(training, file = trainfile, sep = " ", row.names = FALSE, col.names = FALSE,
              quote = FALSE, append = FALSE)
  
  test <-  data.frame(filter(data,setnumber == i)[,-ncol(data)])
  testfile <- file.path(paste0("~/Desktop/test", i ,".txt"))
  write.table(test,file = testfile , sep = " ", row.names = FALSE, col.names = FALSE,
              quote = FALSE, append = FALSE)
}


