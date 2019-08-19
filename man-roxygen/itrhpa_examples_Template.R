#' @examples
#' ##Let's approximate some three truncated random variables joint interval distribution function
#' ##at lower and upper points (0,1, 0.2, 0.3) and  (0,4, 0.5, 0.6) correspondingly
#' ##with hermite polynomial of (1,2,3) degrees which polynomial coefficients equals 1 except
#' ##coefficient related to x1*(x^3) polynomial element which equals 2. Also suppose that normal
#' ##density related mean vector equals (1.1, 1.2, 1.3) while standard deviations vector is
#' ##(2.1, 2.2, 2.3). Suppose that lower and upper truncation are (-1.1,-1.2,-1.3) and
#' ##(1.1,1.2,1.3) correspondingly.
#' 
#' #Prepare initial values
#'	x_lower <- matrix(c(0.1, 0.2, 0.3), nrow=1)
#'	x_upper <- matrix(c(0.4, 0.5, 0.6), nrow=1)
#' tr_left = matrix(c(-1.1,-1.2,-1.3), nrow = 1)
#' tr_right = matrix(c(1.1,1.2,1.3), nrow = 1)
#'	mean <- c(1.1, 1.2, 1.3)
#'	sd <- c(2.1, 2.2, 2.3)
#'	pol_degrees <- c(1, 2, 3)
#'	
#' #Create polynomial powers and indexes correspondence matrix
#' pol_ind <- polynomialIndex(pol_degrees)
#'	#Set all polynomial coefficients to 1
#'	pol_coefficients <- rep(1, ncol(pol_ind))
#'	pol_degrees_n <- length(pol_degrees)
#'	
#'	#Assign coefficient 2 to the polynomial element(x1 ^ 1)*(x2 ^ 0)*(x3 ^ 2)
#'	pol_coefficients[which(colSums(pol_ind == c(1, 0, 2)) == pol_degrees_n)] <- 2
#'	#Visualize correspondence between polynomial elements and their coefficients
#'	as.data.frame(rbind(pol_ind, pol_coefficients),
#'		row.names = c("x1 power", "x2 power", "x3 power", "coefficients"),
#'		optional = TRUE)
#' printPolynomial(pol_degrees, pol_coefficients)
#' 
#' #Calculate idf approximation at points x_lower and x_upper
#' itrhpa(x_lower = x_lower, x_upper = x_upper, 
#'		pol_coefficients = pol_coefficients, pol_degrees = pol_degrees,
#'		mean = mean, sd = sd,
#'     tr_left = tr_left, tr_right = tr_right)
#'     
#' #Condition second component to be 0.7
#' #Substitute x second component with conditional value 0.7
#' x_upper <- matrix(c(0.4, 0.7, 0.6), nrow = 1)
#'	#Set TRUE to the second component indicating that it is conditioned
#'	given_ind <- c(FALSE, TRUE, FALSE)
#'	
#' #Calculate conditional(on x2 = 0.5) idf approximation at points x_lower and x_upper
#'	itrhpa(x_lower = x_lower, x_upper = x_upper,
#'		pol_coefficients = pol_coefficients, pol_degrees = pol_degrees,
#'		mean = mean, sd = sd,
#'		given_ind = given_ind,
#'     tr_left = tr_left, tr_right = tr_right)
#'     
#' #Consider third component marginal distribution
#' #conditioned on the second component 0.7 value
#' #Set TRUE to the first component indicating that it is omitted
#' omit_ind <- c(TRUE, FALSE, FALSE)
#' 
#'	#Calculate conditional (on x2=0.5) marginal (for x3) idf approximation at points x_lower and x_upper
#'	itrhpa(x_lower = x_lower, x_upper = x_upper,
#'		pol_coefficients = pol_coefficients, pol_degrees = pol_degrees,
#'		mean = mean, sd = sd,
#'		given_ind = given_ind, omit_ind = omit_ind,
#'     tr_left = tr_left, tr_right = tr_right)
