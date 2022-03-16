using My-Julia-ML-Package
using Documenter

DocMeta.setdocmeta!(My-Julia-ML-Package, :DocTestSetup, :(using My-Julia-ML-Package); recursive=true)

makedocs(;
    modules=[My-Julia-ML-Package],
    authors="Sandesh Katakam",
    repo="https://github.com/sandeshkatakam/My-Julia-ML-Package.jl/blob/{commit}{path}#{line}",
    sitename="My-Julia-ML-Package.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://sandeshkatakam.github.io/My-Julia-ML-Package.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/sandeshkatakam/My-Julia-ML-Package.jl",
    devbranch="master",
)
