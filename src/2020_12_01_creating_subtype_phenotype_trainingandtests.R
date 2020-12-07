library(dplyr)


args = commandArgs(trailingOnly=TRUE)


data <- read.table(args)

data <- mutate(data, setnumber=rep_len(c(1:10),nrow(data)))

out_base <- "~/data/"
name_base <- "MDD2.nowithdrawn."


for (i in 1:10) {
  training <- data.frame(filter(data,setnumber != i)[,-ncol(data)])
  trainfile <- file.path(paste0(out_base,name_base,"training", i , ".phen"))
  write.table(training, file = trainfile, sep = " ", row.names = FALSE, col.names = FALSE,
              quote = FALSE, append = FALSE)

  test <-  data.frame(filter(data,setnumber == i)[,-ncol(data)])
  testfile <- file.path(paste0(out_base,name_base,"test", i , ".phen"))
  write.table(test,file = testfile , sep = " ", row.names = FALSE, col.names = FALSE,
              quote = FALSE, append = FALSE)
}



