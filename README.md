# Cas9_md

Personal thesis project for performing an MD simulation of the sgRNA-DNA-Cas9 complex and analyse the trajectory using mainly MDAnalysis and PyInteraph.
## Installation

I use three different environments created with conda for different parts of the project.
One is for the moste recent version of MDAnalysis:

```bash
conda create  --name mdanalysis MDAnalysis tabulate ipywidgets ipython_genutils nglview 
conda activate mdanalysis
python -m ipykernel install --user --name=mdanalysis

```

Another one is for [PyInteraph2](https://github.com/ELELAB/pyinteraph2), following the installation instruction provided for Conda.

And finally a Julia environment is used to create certain plots and figures.

```bash
activate .

add DataFrames, CSV, LinearAlgebra, DelimitedFiles, CairoMakie, ProgressMeter, IJulia
build Compat
build IJulia
build Makie

```
