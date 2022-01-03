using Pkg, Markdown, JSON

function installed()
  deps = Pkg.dependencies()
  installs = Dict{String, Any}()
  for (_, dep) in deps
    dep.is_direct_dep || continue
    installs[dep.name] = dep.version
  end
  return installs
end

const jso_pkgs = ["ADNLPModels", "CaNNOLeS", "DCISolver", "JSOSolvers", "LinearOperators", "ManualNLPModels", "NLPModels", "NLPModelsIpopt", "NLPModelsJuMP", "Percival", "SolverBenchmark", "SolverCore", "SolverTools"]

function badge(name, version)
  color, lbl_color = if name in jso_pkgs
    h = div(360 * findfirst(name .== jso_pkgs), length(jso_pkgs))
    "hsl($h,100%25,30%25)", "hsl($h,30%25,30%25)"
  elseif version == "STDLIB"
    "666", "444"
  else
    "666", "999"
  end

  "<img class=\"badge\" src=\"https://img.shields.io/badge/$name-$version-$color?style=flat-square&labelColor=$lbl_color\">"
end

function hfun_list_versions()
  lt_file = locvar("fd_rpath")[1:end-2] * "jl"
  lines = readlines(lt_file)
  pkgs = String[]
  for line in lines
    if match(r"^using", line) !== nothing
      sline = split(line[7:end], ", ")
      append!(pkgs, sline)
    end
  end
  pkgs = unique(sort(pkgs))
  dict = installed()
  out = ""
  for pkg in pkgs
    if haskey(dict, pkg)
      out *= badge(pkg, dict[pkg]) * "\n"
    elseif pkg in readdir(Base.Sys.STDLIB)
      out *= badge(pkg, "STDLIB") * "\n"
    end
  end
  out
end

function aux_latest()
  data = JSON.parsefile("_data/docs.json")
  data = sort(data, by=x->x["date"], rev=true)
  data[1]
end

hfun_latest_link() = "https://jso-docs.github.io/" * aux_latest()["repo"]
hfun_latest_short() = aux_latest()["short"]
hfun_latest_title() = aux_latest()["title"]

function hfun_rfig(params)
  # Building locally or the main site shouldn't add the link
  repo = split(get(ENV, "GITHUB_REPOSITORY", "nothing/jso-docs.github.io"), "/")[2]
  if repo == "jso-docs.github.io"
    repo = ""
  end
  file = "/" * joinpath(repo, "plots", params[1])
  caption = join(params[2:end], " ")
  """
  <figure>
    <img class=\"image\" src=\"$file\">
    <figcaption>$caption</figcaption>
  </figure>
  """
end