# This file was generated, do not modify it. # hide
isdir("plots") || mkdir("plots")
cp("_assets/jso.png", joinpath("plots", "jso.png"); force=true)
print("No errors")