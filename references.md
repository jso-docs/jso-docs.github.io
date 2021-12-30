@def title = "References"

# Publications, talks and other references

If you use JSO, we ask that you cite us. In addition to any specific reference that may suggested by the packages you are using, we also ask you to cite:

**JuliaSmoothOptimizers**. Dominique Orban and Abel Soares Siqueira. Zenodo. Apr, 2019. [10.5281/zenodo.2655082](https://doi.org/10.5281/zenodo.2655082)
```plaintext
@Misc{jso-2019,
  author = {D. Orban and A. S. Siqueira},
  title = {{JuliaSmoothOptimizers}: Infrastructure and Solvers for Continuous Optimization in {J}ulia},
  doi = {10.5281/zenodo.2655082},
  URL = {https://juliasmoothoptimizers.github.io},
  year = {2019},
}
```

```julia:./list-publications.jl
using JSON
data = JSON.parsefile("_data/bib.json")
data = sort(data, by=x->x["date"], rev=true)
for key in ["Books", "Publications", "Talks", "Classes"]
  println("### $key")
  for d in filter(x -> x["key"] == key, data)
    url = get(d, "link", nothing)
    if url === nothing
      print("- $(d["title"]), ")
    else
      print("- [$(d["title"])]($url), ")
    end
    D = Dates.format(Date(d["date"]), "yyyy-u-d")
    println(join([d["author"], "_$(D)_", d["where"]], ", "))
  end
end
```
\textoutput{./list-publications}