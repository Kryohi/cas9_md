using LinearAlgebra, DataFrames, CSV
using CairoMakie
Base.:(+)(a::String, b::String) = string(a,b)

plotpath = "../plots/";
datapath = "../data/analysis/";
output_name = "prod_global_";

df = DataFrame(CSV.File("../data/analysis/pca.csv"))
df_time = df[:,end]
df = df[:,1:end-1]

## TODO
# heatbar
# come mettere color nel tema
# lineplot sulla diagonale

function pairplot(df; stride=10, colormap=:thermal, resolution=(1400,1400))

    dim = size(df,2) # how many colums there are in the dataframe
    idxs = 1:stride:size(df,1)
    colorant = range(0, 1, length=length(idxs))

    pp_theme = Attributes(
        Axis = (
            aspect = 1,
            topspinevisible = false,
            rightspinevisible = false,
            xticklabelsvisible = false,
            yticklabelsvisible = false
        ),
        Scatter = (
            colormap = colormap, # try :thermal :Oranges_9, :darkrainbow
            markersize = 6
        )
    )

    f = with_theme(pp_theme) do
        f = Figure(resolution=resolution)

        for i in 1:dim, j in 1:dim

            ax = Axis(f[i, j])
            scatter!(df[idxs,j], df[idxs,i], color = colorant)

            if i==dim
                ax.xticklabelsvisible = true
                ax.xlabel = names(df)[j]
            end
            if j==1
                ax.yticklabelsvisible = true
                ax.ylabel = names(df)[i]
            end
        end
        f
    end
end

pp = pairplot(df, stride=2)

save(plotpath+"test_makie_pp.pdf", pp)
pp
