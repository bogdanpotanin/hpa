#' @details If you have precaulculated density or cumulative distribution
#' functions at standartized truncation points (substract \code{mean} and then divide by \code{sd}) 
#' then provide them throught \code{pdf_lower}, \code{pdf_upper}, \code{cdf_lower} and \code{cdf_upper}
#' arguments in order to decrease number of calculations.