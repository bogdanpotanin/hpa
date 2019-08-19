#' @param type string value. Set \code{type="pdf"} to approximate density function where
#' \code{x_upper} is numeric matrix of density function arguments.
#' Assign \code{type="cdf"} to approximate cumulative distribution function.
#' Make \code{type="interval"} to approximate interval distribution function.
#' Set \code{type="expectation"} to calculate components powered expectations product.
#' Make \code{type="expectation truncated"} to calculate truncated expectation where
#' lower and upper truncation limits are given by \code{x_lower} and \code{x_upper} correspondingly.