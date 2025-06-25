# Stochastic-dominance-with-ordinal-data
This repository contains MATLAB code for the paper:

"Bayesian Inference for Health Inequality and Welfare Using Qualitative Data"
David Gunawan, William Griffiths, and Duangkamon Chotikapanich (2018)
Economics Letters, 168, pp. 82–86.

📖 Overview
This code implements a Bayesian framework for analysing health inequality and welfare using ordinal (qualitative) data. It estimates posterior distributions for categorical health proportions via the Dirichlet distribution, and computes posterior probabilities of stochastic dominance between different time periods or population groups.

Please refer to the published paper for detailed methodology and interpretation of results.

🔧 How to Use
1. Data Preparation
You must supply your own ordinal health data for each year or group, saved as .mat files.
Example simulated datasets are provided:

health_data_2002.mat

health_data_2005.mat

Each file should contain a vector of ordinal health responses, such as categorical ratings from a survey.

2. Step-by-Step Workflow
Step 1: Estimate Dirichlet Parameters
Use est_prop.m to generate posterior draws of the Dirichlet parameters based on the ordinal data.
Example output files:

param_2002.mat

param_2005.mat

Step 2: Compute Posterior Dominance Probabilities
Use ordinal_dominance.m with the outputs from Step 1 to compute the posterior probabilities of stochastic dominance across time or groups.


