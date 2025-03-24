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
    dilution <- convert_mfi_to_dilution(mfi,params_new)
    ref_mfi <- convert_dilution_to_mfi(dilution,params_ref_new)
    convert_mfi_to_dilution(ref_mfi,params_ref_old)
}
