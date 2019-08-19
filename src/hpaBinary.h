#ifndef hpa_hpaBinary_H
#define hpa_hpaBinary_H

#include <RcppArmadillo.h>

using namespace Rcpp;
using namespace RcppArmadillo;

Rcpp::List hpaBinary(Rcpp::Formula formula,
	Rcpp::DataFrame data,
	int K,
	double z_mean_fixed,
	double z_sd_fixed,
	double z_constant_fixed,
	bool is_z_coef_first_fixed,
	bool is_x0_probit,
	bool is_sequence,
	Rcpp::NumericVector x0);

double hpaBinaryLnLOptim(Rcpp::NumericVector x0,
	Rcpp::List is_List,
	arma::vec z_1,
	arma::vec z_0,
	arma::mat z_d_1,
	arma::mat z_d_0,
	int K,
	double z_mean_fixed,
	double z_sd_fixed,
	double z_constant_fixed0,
	Rcpp::NumericVector pol_coefficients_ind,
	int z_mean_ind,
	int z_sd_ind,
	Rcpp::NumericVector z_coef_ind,
	bool is_minus);

Rcpp::NumericVector predict_Binary(Rcpp::List model, 
	Rcpp::DataFrame newdata, 
	bool is_prob);

Rcpp::List summary_Binary(Rcpp::List model);

void print_summary_Binary(Rcpp::List model);

void plot_Binary(Rcpp::List model);

double AIC_Binary(Rcpp::List model);

double logLik_Binary(Rcpp::List model);

#endif