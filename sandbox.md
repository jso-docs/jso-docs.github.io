@def title = "Sandbox"

# Sandbox

Where I try configuration things.

## rfig

```julia:./copy-jso.jl
cp("_assets/jso.png", joinpath(@OUTPUT, "jso.png"); force=true)
println(@OUTPUT)
```
\output{./copy-jso.jl}

{{ rfig jso.png JSO logo - testing that rfig works }}