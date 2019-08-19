#' @examples
#' \dontrun{
#' ##Let's estimate wage equation accounting for non-random selection.
#' ##See the reference to Mroz TA (1987) to get additional details about
#' ##the data this examples use
#' 
#' #Prepare data
#' library("sampleSelection")
#' data("Mroz87")
#'	h = data.frame("kids" = as.numeric(Mroz87$kids5 + Mroz87$kids618 > 0),
#'		"age" = as.numeric(Mroz87$age),
#'		"faminc" = as.numeric(Mroz87$faminc),
#'		"educ" = as.numeric(Mroz87$educ),
#'		"exper" = as.numeric(Mroz87$exper),
#'		"city" = as.numeric(Mroz87$city),
#'		"wage" = as.numeric(Mroz87$wage),
#'		"lfp" = as.numeric(Mroz87$lfp))
#'		
#' #Estimate model parameters
#' model <- hpaSelection(selection = lfp ~ age + I(age^2) + I(log(faminc)) + educ + kids,
#'		outcome = log(wage) ~exper + I(exper ^ 2) + educ + city,
#'		z_K = 1, y_K = 2, data = h)
#' summary(model)
#' 
#' #Plot outcome equation random errorrs density
#' plot(model,is_outcome = TRUE)
#' #Plot selection equation random errorrs density
#' plot(model,is_outcome = FALSE)
#' }
#' 
#' ##Estimate semi-nonparametric sample selection model
#' ##parameters on simulated data given chi-squared random errors
#'
#' set.seed(123)
#' library("mvtnorm")
#'
#' #Sample size
#'
#' n <- 500
#'
#' #Simulate independent variables
#' X_rho <- 0.5
#' X_sigma <- matrix(c(1,X_rho,X_rho,X_rho,1,X_rho,X_rho,X_rho,1), ncol=3)
#' X <- rmvnorm(n=n, mean = c(0,0,0), 
#'              sigma = X_sigma)
#'
#' #Simulate random errors
#' epsilon <- matrix(0, n, 2)
#' epsilon_z_y <- rchisq(n, 5)
#' epsilon[, 1] <- (rchisq(n, 5) + epsilon_z_y) * (sqrt(3/20)) - 3.8736
#' epsilon[, 2] <- (rchisq(n, 5) + epsilon_z_y) * (sqrt(3/20)) - 3.8736
#' #Simulate selection equation
#' z_star <- 1 + 1 * X[,1] + 1 * X[,2] + epsilon[,1]
#' z <- as.numeric((z_star > 0))
#'
#' #Simulate outcome equation
#' y_star <- 1 + 1 * X[,1] + 1 * X[,3] + epsilon[,2]
#' z <- as.numeric((z_star > 0))
#' y <- y_star
#' y[z==0] <- NA
#' h <- as.data.frame(cbind(z, y, X))
#' names(h) <- c("z", "y", "x1", "x2", "x3")
#'
#' #Estimate parameters
#' model <- hpaSelection(selection = z ~ x1 + x2, 
#'                       outcome = y ~ x1 + x3,
#'                       data = h, z_K = 1, y_K = 2)
#' summary(model)
#'
#' #Get conditional predictions for outcome equation
#' model_pred_c <- predict(model,is_cond = TRUE)
#' #Conditional predictions y|z=1
#' model_pred_c$y_1
#' #Conditional predictions y|z=0
#' model_pred_c$y_0
#'
#' #Get unconditional predictions for outcome equation
#' model_pred_u <- predict(model,is_cond = FALSE)
#' model_pred_u$y
#'
#' #Get conditional predictions for selection equation
#' #Note that for z=0 these predictions are NA
#' predict(model, is_cond = TRUE, is_outcome = FALSE)
#' #Get unconditional predictions for selection equation
#' predict(model, is_cond = FALSE, is_outcome = FALSE)
