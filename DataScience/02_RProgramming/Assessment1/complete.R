getmonitor <- function(id, directory, summarize = FALSE) {
  
  filename = sprintf("%s/%03d.csv", directory, as.numeric(id))
  result = read.csv(filename)
  
  if (summarize) {
    print(summary(result))
  }
  
  result
}

complete=function(directory,id=1:332){

  outputs = lapply(id, getmonitor, directory = directory)
  compCases = lapply(outputs, complete.cases)
  
  # count is length(which(logical.vector))
  onlyTrues = lapply(compCases, which)
  nobs = sapply(onlyTrues, length)
  
  data.frame(id, nobs)
}