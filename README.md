Project Overview

This project analyzes customer loyalty program data and segments customers based on purchasing behavior, spending patterns, and reward point balances. The goal is to identify meaningful customer groups such as high-value regulars, casual shoppers, bargain hunters, and dormant members to support business insights and decision-making.

The analysis is implemented in R using the tidyverse ecosystem.


Libraries Used

The following R libraries are required to run the analysis:

dplyr – Data manipulation and transformation

readr – Reading CSV files efficiently

stringr – Cleaning and formatting string-based numeric values

Make sure these libraries are installed before running the script:

install.packages(c("dplyr", "readr", "stringr"))


File Structure
├── loyalty_segmentation.R        # Main R script for data cleaning and segmentation
├── loyaltypointreport.csv        # Input dataset (customer loyalty data)
├── README.md                     # Project documentation


Script Description

The R script performs the following steps:

Data Import

Reads loyaltypointreport.csv into R.


Data Cleaning

Renames columns for consistency.

Removes currency symbols and commas.

Converts relevant fields to numeric values.

Customer Segmentation

Customers are classified into segments:

High-Value Regulars

Casual Shoppers

One-Time / First-Time Buyers

Bargain Hunters / Reward Users

Silent Supporters


Summary Statistics

Calculates the number of customers, average spending, average points, and percentage share for each segment.

Output

Prints a summary table showing customer distribution across segments.

/br
How to Run the Project

Clone or download the repository.

Place loyaltypointreport.csv in the same directory as the R script.

Open the script in RStudio.

Run the script from top to bottom.
