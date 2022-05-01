# Stochastic-dominance-with-ordinal-data
This is the code for the paper "Bayesian inference for health inequality and welfare using qualitative data"
David Gunawan, William Griffiths, and Duangkamon Chotikapanich, Economic Letters, 2018

Please read the paper for more information. The user needs to supply their own data.

health_data_2002.mat and health_data_2005 are simulated examples of the required data for this package. First, for each year, you need to use est_prop.m to give the posterior draws of the parameters from the Dirichlet distributions. The files param_2002.mat and param_2005.mat are the examples. Second, using the posterior draws obtained from the first step, you then use ordinal_dominance.m to obtain the posterior probabilities of stochastic dominance.
