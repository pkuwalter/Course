pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  files_full <- list.files(directory, full.names=TRUE) 
  dat <- data.frame()
  
  for (i in id) {
    dat <- rbind(dat, read.csv(files_full[i]))
  }
  data_subset <- subset(dat,dat$ID<=max(id)&dat$ID>=min(id))
  
  if (pollutant=="sulfate"){
    result <- mean(data_subset$sulfate,na.rm=T)}
  if (pollutant=="nitrate"){
    result <- mean(data_subset$nitrate,na.rm=T)}
  return (result)
}