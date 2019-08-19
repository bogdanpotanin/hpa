#' @examples
#' \donttest{
#' ##Approximate student (t) distribution
#' 
#' #Simulate 5000 realizations of student distribution with 5 degrees of freedom
#' n <- 5000
#'	df <- 5
#'	x <- matrix(rt(n, df), ncol = 1)
#'	pol_degrees <- c(4)
#'	
#'	#Apply pseudo maximum likelihood routine
#'	ml_result <- hpa::hpaML(x = x, pol_degrees = pol_degrees)
#' summary(ml_result)
#' 
#' #Get predicted probabilites (density values) approximations
#' predict(ml_result)
#' 
#' ##Approximate chi-squared distribution
#' 
#' #Simulate 5000 realizations of chi-squared distribution with 5 degrees of freedom
#' #Let's set lower truncation point at sample minimum realization
#' n <- 5000
#'	df <- 5
#'	x <- matrix(rchisq(n, df), ncol = 1)
#'	pol_degrees <- c(1)
#'	tr_left <- as.vector(min(x))
#'	tr_right <- as.vector(max(x))
#'	
#'	#Apply pseudo maximum likelihood routine
#'	ml_result <- hpa::hpaML(x = x, pol_degrees = as.vector(pol_degrees), 
#'					tr_left = as.vector(tr_left),
#'					tr_right = as.vector(tr_right))
#' summary(ml_result)
#' 
#' #Get predicted probabilites (density values) approximations
#' predict(ml_result)
#'
#' ##Approximate multivariate student (t) distribution
#' ##Note that calculations may take up to a minute
#' 
#' #Simulate 5000 realizations of three dimensional student distribution with 5 degrees of freedom
#' library("MultiRNG")
#' cov_mat <- matrix(c(1, 0.25, -0.25, 0.25, 1, 0.25, -0.25, 0.25, 1), ncol = 3)
#'	x <- rmvt(n = 5000, sigma = cov_mat, df = 5)
#'	
#' #Estimate approximating joint distribution parameters
#' model <- hpaML(x = x, pol_degrees = c(1,1,1))
#' 
#' #Get summary
#' summary(model)
#' 
#' #Get predicted values for joint density function
#' predict(model)
#' 
#' ##Approximate student (t) distribution and plot densities approximated
#' ##under different hermite polynomial degrees against 
#' ##true density (of student distribution)
#' 
#' #Simulate 5000 realizations of t-distribution with 5 degrees of freedom
#' n <- 5000
#' df <- 5
#' x <- matrix(rt(n, df), ncol=1)
#'
#' #Apply pseudo maximum likelihood routine
#' #Create matrix of lists where i-th element contains hpaML results for K=i
#' ml_result <- matrix(list(), 4, 1)
#' for(i in 1:4)
#' {
#'  ml_result[[i]] <- hpa::hpaML(x = x, pol_degrees = i)
#' }
#'
#' #Generate test values
#' test_values <- seq(qt(0.001, df), qt(0.999, df), 0.001)
#' n0 <- length(test_values)
#'
#' #t-distribution density function at test values points
#' true_pred <- dt(test_values, df)
#' 
#' #Create matrix of lists where i-th element contains densities predictions for K=i
#' PGN_pred <- matrix(list(), 4, 1)
#' for(i in 1:4)
#' {
#'   PGN_pred[[i]] <- predict(model = ml_result[[i]], 
#'                           newdata = matrix(test_values, ncol=1))
#' }

#' #Plot the result
#' library("ggplot2")
#' 
#' #prepare the data
#' h <- data.frame("values" = rep(test_values,5),
#'                 "predictions" = c(PGN_pred[[1]],PGN_pred[[2]],
#'                                   PGN_pred[[3]],PGN_pred[[4]],
#'                                   true_pred), 
#'                 "Density" = c(
#'                   rep("K=1",n0), rep("K=2",n0),
#'                   rep("K=3",n0), rep("K=4",n0),
#'                   rep("t-distribution",n0))
#'                   )
#'                   
#' #build the plot
#' ggplot(h, aes(values, predictions)) + geom_point(aes(color = Density)) +
#'   theme_minimal() + theme(legend.position = "top", text = element_text(size=26),
#'                          legend.title=element_text(size=20), legend.text=element_text(size=28)) +
#'   guides(colour = guide_legend(override.aes = list(size=10))
#'   )
#'
#' #Get informative estimates summary for K=4 (minimal AIC)
#' summary(ml_result[[4]])
#' }
#' \dontshow{
#' ##Approximate student (t) distribution
#' 
#' #Simulate 250 realizations of student distribution with 5 degrees of freedom
#'  set.seed(2)
#'  n <- 250
#'	df <- 5
#'	x <- matrix(rt(n, df), ncol = 1)
#'	pol_degrees <- c(2)
#'	
#'	#Apply pseudo maximum likelihood routine
#'	ml_result <- hpa::hpaML(x = x, pol_degrees = pol_degrees)
#'  summary(ml_result)
#' 
#' #Get predicted probabilites (density values) approximations
#' predict(ml_result)
#' }