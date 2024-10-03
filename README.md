# Qatar Rental Real Estate Index: Codebase

This repository contains the code used in the analysis and construction of the Qatar Rental Price Index (QRPI), which is a critical part of the paper on the Qatar Rental Real Estate Index. Below is a brief description of each file included in this project.

## Files Description

### 1. `ksa_qa_analysis2.ipynb`
This Jupyter notebook contains the primary analysis for comparing the real estate market between Qatar and Saudi Arabia. It includes data wrangling, exploratory data analysis (EDA), visualization of trends, and the computation of key metrics used in the study. The notebook performs the following tasks:
- Data preprocessing for rental listings.
- Time-series analysis to observe trends in rental prices.
- Visualization of rental price distributions.
- Computation of key indices for both countries.
- Statistical tests comparing the rental markets.

### 2. `QRPI_construction.ipynb`
This Jupyter notebook outlines the process of constructing the Qatar Rental Price Index (QRPI). It includes data preprocessing, calculation of indices, and adjustments for inflation and other market factors. The notebook is organized as follows:
- Data cleaning and preparation of the dataset.
- Construction of the rental price index using hedonic regression models.
- Calculation of the final QRPI values for various time periods.
- Visualization of the QRPI over time.

### 3. `0_Index_construction.do`
This Stata `.do` file contains code for constructing the rental price index. It uses hedonic regression techniques to adjust for various property characteristics and compute the overall price index. The key steps include:
- Loading and preparing the real estate data.
- Running hedonic regressions.
- Index construction based on the regression outputs.

### 4. `0_subset_hedonic_pca.do`
This Stata `.do` file is responsible for performing a subset analysis and applying Principal Component Analysis (PCA) on the hedonic regression models. It includes:
- Preprocessing data for the subset of interest.
- Running PCA to reduce dimensionality and identify significant factors affecting rental prices.
- Applying the hedonic model to the transformed data.
- Producing intermediate results that inform the main index construction.

## How to Run

1. **Jupyter Notebooks:**
   - Open the `.ipynb` files in Jupyter Notebook.
   - Ensure you have the required Python packages (pandas, matplotlib, statsmodels, etc.) installed.
   - Run the cells in the notebooks sequentially to reproduce the results.

2. **Stata Files:**
   - Open the `.do` files in Stata.
   - Execute the commands to perform the regression and index construction.
   - Ensure that the required data files are loaded before running the scripts.

## License
This project is for academic use only as part of a research paper on the Qatar Rental Real Estate Index.
