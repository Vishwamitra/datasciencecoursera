corr <- function(directory, threshold = 0) {
  
  cor_results <- numeric(0)
  
  #read all the complete data count table
  complete_cases <- complete(directory)
  # now filter the complete data where no of complete row is higher than threshold
  complete_cases <- complete_cases[complete_cases$nobs>=threshold, ]
  
  if(nrow(complete_cases)>0){
    for(i in complete_cases$id){
      file_name <- paste(c("./", directory, "/",sprintf("%03d", i),".csv"), collapse = "")
      check_data <- read.csv(file_name, as.is = T, header = T)
      
      data <- check_data[complete.cases(check_data),]
      
      if (nrow(data) > threshold) {
        cor_results <- c(cor_results, cor(data[,"sulfate"], data[, "nitrate"]))
      }
    }
  }
  cor_results
  
}

