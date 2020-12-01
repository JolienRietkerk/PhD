library(dplyr)


path = "~/Documents/My Data/BRAZIL/Elections/"
out.file<-""
file.names <- dir(path, pattern =".txt")
for(i in 1:length(file.names)){
  file <- read.table(file.names[i],header=TRUE, sep=";", stringsAsFactors=FALSE)
  out.file <- rbind(out.file, file)
}
 write.table(out.file, file = "cand_Brazil.txt",sep=";", 
             row.names = FALSE, qmethod = "double",fileEncoding="windows-1252")
             
             


data <- read.table("/projects/biobank/release2/pheno/MDD2.nowithdrawn.phen")

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



