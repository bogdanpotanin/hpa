#' @examples
#' ## Get polynomial indexes matrix for the polynomial which degrees are (1, 3, 5)
#' 
#' polynomialIndex(c(1, 3, 5))
#' 
#' \dontrun{
#' ## Consider polynomial of degrees (2, 1) such that coefficients
#' ## for elements which powers sum is even are 2 and for those which powers
#' ## are odd are 5. So the polynomial is 2+5y+5x+2xy+2x^2+5yx^2.
#' 
#' # Let's represent its powers (not coefficients) in a matrix form
#' pol_matrix <- polynomialIndex(c(2, 1))
#' 
#' # Suppose we want to calculate this polynomial coefficients sum:
#' powers_sum <- 0
#' 
#' # For pedagogical reasons iterate throught the pol_matrix columns
#' pol_matrix_length = dim(pol_matrix)[2]
#' 
#' for (i in 1:pol_matrix_length) 
#' {
#'		if ((pol_matrix[1, i] + pol_matrix[2, i]) %% 2 == 0)
#'		{
#'		  powers_sum <- powers_sum + 2
#'		} else {
#'		  powers_sum <- powers_sum + 5
#'		}
#' }
#' #powers_sum value will be 21
#' }
