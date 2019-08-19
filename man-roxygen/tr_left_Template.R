#' @param tr_left numeric matrix of left (lower) truncation limits.
#' Note that \code{tr_right} rows are observations while variables are columns.
#' If \code{tr_left} or \code{tr_right} is single row matrix then the same 
#' truncation limits would be applied to all observations that are determined 
#' by the first rows of these matrices.