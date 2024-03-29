% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{normalMoment}
\alias{normalMoment}
\title{Calculate k-th order moment of normal distribution}
\usage{
normalMoment(k = 0L, mean = 0, sd = 1, return_all_moments = FALSE,
  is_validation = TRUE)
}
\arguments{
\item{k}{non-negative integer moment order.}

\item{mean}{numeric expected value.}

\item{sd}{positive numeric standard deviation.}

\item{return_all_moments}{logical; if \code{TRUE}, function returns the matrix (1 row, k+1 columns)
of moments of normaly distributed random variable with mean = \code{mean}
and standard deviation = \code{sd}. Note that i-th column value corresponds to the (i-1)-th moment.}

\item{is_validation}{bool value indicating whether function input arguments should be validated. 
Set it to FALSE for slight perfomance boost (default value is TRUE).}
}
\value{
This function returns \code{k}-th order moment of
normal distribution which mean equals to \code{mean} and standard deviation is \code{sd}.
If \code{return_all_moments} is \code{TRUE} then see this argument description above for
output details.
}
\description{
This function iteratively calculates k-th order moment of normal distribution.
}
\details{
This function estimates \code{k}-th order moment of
normal distribution which mean equals to \code{mean} and standard deviation equals to \code{sd}.\cr

Note that parameter \code{k} value automatically converts to integer.
So passing non-integer \code{k} value will not cause any errors but the calculations will be
performed for rounded \code{k} value only.
}
\examples{
##Calculate 5-th order moment of normal random variable which
##mean equals to 3 and standard deviation is 5.

#5-th moment
normalMoment(k = 5, mean = 3, sd = 5)

#(0-5)-th moments
normalMoment(k = 5, mean = 3, sd = 5, return_all_moments = TRUE)

}
