using Statistics, Plots, DataFrames, CSVFiles, LaTeXStrings
gr()

## CSV import
cd("./Data_scattering")
df_E = DataFrame(load("eigenvalues.csv"))
