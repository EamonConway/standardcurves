inverse_log_logistic_5p <- function(y,b,c,d,e,f){
  A <- (d/(y-c))^(1/f)-1
  return(exp(-e) *A^(1/b))
}