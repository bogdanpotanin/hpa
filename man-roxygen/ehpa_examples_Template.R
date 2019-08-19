#' @examples
#' ##Let's approximate some three random variables powered product expectation for powers (3,2,1)
#' ##with hermite polynomial of (1,2,3) degrees which polynomial coefficients equals 1 except
#' ##coefficient related to x1*(x^3) polynomial element which equals 2. Also suppose that normal density related
#' ##mean vector equals (1.1, 1.2, 1.3) while standard deviations vector is (2.1, 2.2, 2.3).
#' 
#' #Prepare initial values
#' expectation_powers = c(3,2,1)
#'	mean <- c(1.1, 1.2, 1.3)
#'	sd <- c(2.1, 2.2, 2.3)
#'	pol_degrees <- c(1, 2, 3)
#'	
#' #Create polynomial powers and indexes correspondence matrix
#' pol_ind <- polynomialIndex(pol_degrees)
#' 
#'	#Set all polynomial coefficients to 1
#'	pol_coefficients <- rep(1, ncol(pol_ind))
#'	pol_degrees_n <- length(pol_degrees)
#'	
#'	#Assign coefficient 2 to the polynomial element (x1 ^ 1)*(x2 ^ 0)*(x3 ^ 2)
#'	pol_coefficients[which(colSums(pol_ind == c(1, 0, 2)) == pol_degrees_n)] <- 2
#'	
#'	#Visualize correspondence between polynomial elements and their coefficients
#'	as.data.frame(rbind(pol_ind, pol_coefficients),
#'		row.names = c("x1 power", "x2 power", "x3 power", "coefficients"),
#'		optional = TRUE)
#' printPolynomial(pol_degrees, pol_coefficients)
#' 
#' #Calculate expected powered product approximation
#' ehpa(pol_coefficients = pol_coefficients, pol_degrees = pol_degrees,
#'		mean = mean, sd = sd, expectation_powers = expectation_powers)
#'		
#' #Condition second component to be 0.5
#' #Substitute x second component with conditional value 0.5
#' x <- matrix(c(NA, 0.5, NA), nrow = 1)
#'	#Set TRUE to the second component indicating that it is conditioned
#'	given_ind <- c(FALSE, TRUE, FALSE)
#'	
#' #Calculate conditional(on x2 = 0.5) expected powered product approximation
#'	ehpa(x = x,
#'		pol_coefficients = pol_coefficients, pol_degrees = pol_degrees,
#'		mean = mean, sd = sd, expectation_powers = expectation_powers,
#'		given_ind = given_ind)
#'		
#' #Consider third component marginal distribution
#' #conditioned on the second component 0.5 value
#' #Set TRUE to the first component indicating that it is omitted
#' omit_ind <- c(TRUE, FALSE, FALSE)
#' 
#'	#Calculate conditional (on x2=0.5) marginal (for x3) expected powered product approximation at points x_lower and x_upper
#'	ehpa(x = x,
#'		pol_coefficients = pol_coefficients, pol_degrees = pol_degrees,
#'		mean = mean, sd = sd, expectation_powers = expectation_powers,
#'		given_ind = given_ind, omit_ind = omit_ind)