#' Convert between curves.
#' @description
#' Convert mfi on new plate to the dilution on the reference plate.
#'
#' @param mfi Known mfi of samples to be converted
#' @param params_new Known parameters for five parameter logistic fit.
#' @param params_ref_new Known parameters for five parameter logistic fit on reference plate
#' @param params_ref_old Known parameters for five parameter logistic fit of the old beads on the sample plate.
#' @return Returns the predicted dilution in comparison to the reference plate
#' @export
convert_between_curves <- function(mfi, params_new, params_ref_new, params_ref_old) {
    dilution <- inverse_log_logistic_5p(
        log(mfi),
        params_new[1],
        params_new[2],
        params_new[3],
        params_new[4],
        exp(params_new[5])
    )

    ref_log_mfi <- log_logistic_5p(
        dilution,
        params_ref_new[1],
        params_ref_new[2],
        params_ref_new[3],
        params_ref_new[4],
        exp(params_ref_new[5])
    )
    inverse_log_logistic_5p(
        ref_log_mfi,
        params_ref_old[1],
        params_ref_old[2],
        params_ref_old[3],
        params_ref_old[4],
        exp(params_ref_old[5])
    )
}
