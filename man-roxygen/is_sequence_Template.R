#' @param is_sequence if TRUE then function calculates models with polynomial degrees from 0 to K
#' each time using initial values obtained from the previous step. In this case function will
#' return the list of models where i-th list element correspond to model calculated under K=(i-1).