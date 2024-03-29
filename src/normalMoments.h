#ifndef hpa_normalMoments_H
#define hpa_normalMoments_H

#include <RcppArmadillo.h>
using namespace Rcpp;
using namespace RcppArmadillo;


Rcpp::NumericVector normalMoment(int k, double mean , double sd, 
								 bool return_all_moments, bool is_validation);

Rcpp::NumericMatrix truncatedNormalMoment(int,
	Rcpp::NumericVector lower,
	Rcpp::NumericVector upper,
	double mean, double sd,
	Rcpp::NumericVector pdf_lower,
	Rcpp::NumericVector cdf_lower,
	Rcpp::NumericVector pdf_upper,
	Rcpp::NumericVector cdf_upper,
	Rcpp::NumericVector cdf_difference,
	bool return_all_moments,
	bool is_validation);

#endif