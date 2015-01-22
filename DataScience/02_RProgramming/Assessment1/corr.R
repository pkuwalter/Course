corr <- function(directory, threshold = 0) {
  c = complete(directory)
  ids = c[c$nobs > threshold, ]$id
  
  calculate.cor = function(row) {
    cc = complete.cases(row)
    cor(row[cc, ]$sulfate, row[cc, ]$nitrate)
  }
  
  above.threshold = lapply(ids, getmonitor, directory = directory)
  sapply(above.threshold, calculate.cor)
}