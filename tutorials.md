@def title = "Tutorials"

# Tutorials and how-to guides

This is a curated list of tutorials.

```julia:./list-docs.jl
using JSON
data = JSON.parsefile("_data/docs.json")
data = sort(data, by=x->x["date"], rev=true)
for entry in data
  title, repo = entry["title"], entry["repo"]
  link = "https://jso-docs.github.io/$repo"
  println("- [$title]($link)")
end
```
\textoutput{./list-docs}

## External tutorials

This is another list of tutorials, from outside sources.

- [Abel Siqueira's YouTube playlist on JSO Tutorials](https://www.youtube.com/playlist?list=PLOOY0eChA1uxmm8G2caFpdX7X9NjgpDUY), Abel Soares Siqueira, 08 April 2020
- [NLPModels.jl and CUTEst.jl: Constrained Optimization](https://abelsiqueira.github.io/blog/_posts/2017/2017-02-17-nlpmodelsjl-and-cutestjl-constrained-optimization/), Abel Soares Siqueira, 17 February 2017
- [NLPModels.jl, CUTEst.jl and other Nonlinear Optimization Packages on Julia](https://abelsiqueira.github.io/blog/_posts/2017/2017-02-07-nlpmodelsjl-cutestjl-and-other-nonlinear-optimization-packages-on-julia/), Abel Soares Siqueira, 07 February 2017