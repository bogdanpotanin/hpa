#' @details Densities hermite polynomial approximation approach has been proposed by A. Gallant and D. W. Nychka in 1987.
#' The main idea is to approximate unknown distribution density with hermite polynomial of degree \code{pol_degree}. 
#' In this framework hermite polynomial represents adjusted (to insure integration to 1) product of squared polynomial and normal distribution densities.
#' Parameters \code{mean} and \code{sd} determine means and standard deviations of normal distribution density functions
#' which are parts of this polynomial.
#' For more information please refer to the literature listed below.
#' @details Parameters \code{mean}, \code{sd}, \code{given_ind}, \code{omit_ind}
#' should have the same length as \code{pol_degrees} parameter.
#' @references A. Gallant and D. W. Nychka. Semi-nonparametric maximum likelihood estimation. \emph{Econometrica}, 55(2):363-90, 1987. DOI: 10.2307/1913241
