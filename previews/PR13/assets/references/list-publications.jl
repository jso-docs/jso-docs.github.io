# This file was generated, do not modify it. # hide
using Bibliography, JSON

function bib_string(
  authors,
  title,
  where,
  date,
  link=nothing,
)
  if link != nothing
    title = "[$title]($link)"
  end
  str = join([title, "**$(authors)**", where, date], ", ")
  str = replace(str, "{" => "", "}" => "", "\\'e" => "é", "\\student" => "")
  return str
end

bib = bibtex_to_web("_data/references.bib")
json = JSON.parsefile("_data/references.json")
json = sort(json, by=x->x["date"], rev=true)

for (type_, title) in [
    ("book", "Books"),
    ("article", "Articles"),
    ("techreport", "Technical Reports"),
    ("talk", "Talks"),
    ("classes", "Classes"),
  ]
  println("### $title")
  #First bibtex
  selected = sort(filter(x -> x.type == type_, bib), by=x -> x.year)
  for v in selected
    str = bib_string(v.names, v.title, v.in, "", v.link)
    icon = """~~~\n<button data-clipboard-text="$(v.cite)" class="button is-small is-rounded is-primary copy-ref"><span class="icon is-small has-text-white"><ion-icon size="large" name="copy"></ion-icon></span></button>\n~~~"""
    println("- " * icon * str)
  end

  #Second json
  selected = filter(x -> x["type"] == type_, json)
  for v in selected
    str = bib_string(v["author"], v["title"], v["where"], Dates.format(Date(v["date"]), "yyyy-u-d"), get(v, "link", nothing))
    println("- " * str)
  end
end