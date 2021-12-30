# This file was generated, do not modify it. # hide
using JSON
data = JSON.parsefile("_data/docs.json")
data = sort(data, by=x->x["date"], rev=true)
for entry in data
  title, repo = entry["title"], entry["repo"]
  link = "https://jso-docs.github.io/$repo"
  println("- [$title]($link)")
end