#' Convert mfi to dilution using known standard curve fit.
#' @description
#' Convert mfi to dilution using known standard curve fit.
#'
#' @param mfi Known mfi of samples
#' @param params Known parameters for five parameter logistic fit.
#' @return Returns the dilution of each sample in mfi.
#' @export
convert_mfi_to_dilution <- function(mfi, params) {
    if (is.null(mfi) | is.null(params)) {
        error("Require both mfi and params to run.")
    }
    y <- log(mfi)
    result <- inverse_log_logistic_5p(
        y,
        params[1],
        params[2],
        params[3],
        params[4],
        exp(params[5])
    )
    result[y > (params[2] + params[3])] <- 1.0
    result[y < params[2]] <- 0.0
    result[result > 1.0] <- 1.0
    return(result)
}
