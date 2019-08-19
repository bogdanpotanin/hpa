#' @examples
#' ##Let's represent polynomial 0.3+0.5x2-x2^2+2x1+1.5x1x2+x1x2^2
#'
#' pol_degrees <- c(1, 2)
#' pol_coefficients <- c(0.3, 0.5, -1, 2, 1.5, 1)
#' 
#' printPolynomial(pol_degrees, pol_coefficients)