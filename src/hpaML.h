#ifndef hpa_hpaML_H
#define hpa_hpaML_H

#include <RcppArmadillo.h>
using namespace Rcpp;
using namespace RcppArmadillo;

Rcpp::List hpaML(Rcpp::NumericMatrix x,
	Rcpp::NumericVector pol_degrees,
	Rcpp::NumericVector tr_left,
	Rcpp::NumericVector tr_right,
	Rcpp::LogicalVector given_ind,
	Rcpp::LogicalVector omit_ind,
	NumericVector x0);

double hpaLnL(Rcpp::NumericMatrix x,
	Rcpp::NumericVector pol_coefficients,
	Rcpp::NumericVector pol_degrees,
	Rcpp::LogicalVector given_ind,
	Rcpp::LogicalVector omit_ind,
	Rcpp::NumericVector mean,
	Rcpp::NumericVector sd);

double hpaLnLOptim(Rcpp::NumericVector x0,
	Rcpp::NumericMatrix x,
	Rcpp::NumericVector pol_coefficients_ind,
	Rcpp::NumericVector pol_degrees,
	Rcpp::LogicalVector given_ind,
	Rcpp::LogicalVector omit_ind,
	Rcpp::NumericVector mean_ind,
	Rcpp::NumericVector sd_ind,
	bool minus,
	Rcpp::NumericMatrix tr_left,
	Rcpp::NumericMatrix tr_right);

Rcpp::NumericVector predict_ML(List model,
	Rcpp::NumericMatrix newdata);

void print_summary_ML(Rcpp::List model);

Rcpp::List summary_ML(Rcpp::List model);

double AIC_ML(Rcpp::List model);

double logLik_ML(Rcpp::List model);

Rcpp::StringVector starVector(Rcpp::NumericVector p_values);

#endif