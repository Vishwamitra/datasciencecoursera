complete <- function(directory, id = 1:332){
  
  # FIle names are with leading zeros to make it 3 digit
  formattedID <- (sprintf("%03d",id))
  
  completeCase <- data.frame(id=numeric(0), nobs=numeric(0))
  
  # read throgh each file provided in parameter
  for (i in seq_along(formattedID)) { 
    file_name <- paste(c("./", directory, "/",formattedID[i],".csv"), collapse = "")
    data <- read.csv(file_name)
    
    good_data <- na.omit(data)
    #create a data frame and keep on adding the complete case counts in each loop
    completeCase<- rbind(completeCase, data.frame(id = as.numeric(id[i]), nobs = nrow(good_data)))
  }
  
  # Assign column name of this data frame
  colnames(completeCase) <- c("id", "nobs")
  completeCase
  
}