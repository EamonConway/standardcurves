log_logistic_5p <- function(x, b, c, d, e, f) {
  return(c + d / (1.0 + exp(b * (log(x) + e)))^f)
}