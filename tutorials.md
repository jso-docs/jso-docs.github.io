@def title = "Tutorials"

# Tutorials and how-to guides

This is a curated list of tutorials.

```julia:./list-docs.jl
#hideall
using JSON
data = JSON.parsefile("_data/docs.json")
data = sort(data, by=x->x["date"], rev=true)
for entry in data
  title, repo, short = entry["title"], entry["repo"], entry["short"]
  link = "https://jso-docs.github.io/$repo"
  println("""~~~
  <div class="news-item">
    <a href="$link">
      <span class="is-size-4 has-text-primary">
        $title
      </span>
      <br>
      <p class="has-text-grey-dark is-size-6">
        $short
      </p>
    </a>
  </div>
  ~~~""")
end
```
\textoutput{./list-docs}

## External tutorials

This is another list of tutorials, from outside sources.

- [Abel Siqueira's YouTube playlist on JSO Tutorials](https://www.youtube.com/playlist?list=PLOOY0eChA1uxmm8G2caFpdX7X9NjgpDUY), Abel Soares Siqueira, 08 April 2020
- [NLPModels.jl and CUTEst.jl: Constrained Optimization](https://abelsiqueira.github.io/blog/_posts/2017/2017-02-17-nlpmodelsjl-and-cutestjl-constrained-optimization/), Abel Soares Siqueira, 17 February 2017
- [NLPModels.jl, CUTEst.jl and other Nonlinear Optimization Packages on Julia](https://abelsiqueira.github.io/blog/_posts/2017/2017-02-07-nlpmodelsjl-cutestjl-and-other-nonlinear-optimization-packages-on-julia/), Abel Soares Siqueira, 07 February 2017