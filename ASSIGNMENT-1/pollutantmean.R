pollutantmean <- function(directory, pollutant, id = 1:332){
  
  # FIle names are with leading zeros to make it 3 digit
  formattedID <- (sprintf("%03d",id))
  
  # empty data frame to read and store all the data from all the files
  x1 <- data.frame()
 
  # read throgh each file provided in parameter
  for (i in seq_along(formattedID)) { 
      file_name <- paste(c("./", directory, "/",formattedID[i],".csv"), collapse = "")
      x1 <- rbind(x1, read.csv(file_name))
  }
  
  # calculate mean of all the data in a provided pollutant and return
  mean(as.numeric(x1[ ,pollutant]),na.rm = TRUE)
}
