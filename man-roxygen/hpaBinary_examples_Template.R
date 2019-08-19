#' @examples
#' \donttest{
#' ## Estimate survival probability on Titanic
#' 
#' library("titanic")
#' 
#' #Prepare data set converting  
#' #all variables to numeric vectors
#' h <- data.frame("male" = as.numeric(titanic_train$Sex == "male"))
#' 	h$class_1 <- as.numeric(titanic_train$Pclass == 1)
#' 	h$class_2 <- as.numeric(titanic_train$Pclass == 2)
#' 	h$class_3 <- as.numeric(titanic_train$Pclass == 3)
#' 	h$sibl <- titanic_train$SibSp
#' 	h$survived <- titanic_train$Survived
#' 	h$age <- titanic_train$Age
#' 	h$parch <- titanic_train$Parch
#' 	h$fare <- titanic_train$Fare
#' 	
#' #Estimate model parameters
#' model_hpa_1 <- hpaBinary(survived ~class_1 + class_2 +
#' 	male + age + sibl + parch + fare,
#' 	K = 3, data = h)
#'	#get summary
#' summary(model_hpa_1)
#' 
#' #Get predicted probabilities
#' pred_hpa_1 <- predict(model_hpa_1)
#' 
#' #Calculate number of correct predictions
#' hpa_1_correct_0 <- sum((pred_hpa_1 < 0.5) & (model_hpa_1$dataframe$survived == 0))
#' hpa_1_correct_1 <- sum((pred_hpa_1 >= 0.5) & (model_hpa_1$dataframe$survived == 1))
#' hpa_1_correct <- hpa_1_correct_1 + hpa_1_correct_0
#' 
#' #Plot random errors density approximation
#' plot(model_hpa_1)
#' }
#' 
#' ##Estimate parameters on data simulated from student distribution
#' 
#' library("mvtnorm")
#' set.seed(123456)
#' 
#' #Simulate independent variables from normal distribution
#' n <- 1000
#' X <- rmvnorm(n=n, mean = c(0,0), 
#' sigma = matrix(c(1,0.5,0.5,1), ncol=2))
#' 
#' #Simulate random errors
#' epsilon <- rt(n, 5) * (3 / sqrt(5))
#' 
#' #Calculate latent and observable variables values
#' z_star <- 1 + X[, 1] + X[, 2] + epsilon
#' z <- as.numeric((z_star > 0))
#' 
#' #Store the results into dataframe
#' h <- as.data.frame(cbind(z,X))
#' names(h) <- c("z", "x1", "x2")
#' 
#' #Estimate model parameters
#' model <- hpaBinary(formula = z ~ x1 + x2, data=h, K = 3)
#' summary(model)
#' 
#' #Get predicted probabibilities of 1 values
#' predict(model)
#' 
#' #Plot density function approximation
#' plot(model)
