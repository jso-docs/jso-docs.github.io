@def title = "Sandbox"

# Sandbox

Where I try configuration things.

## rfig

```julia:./copy-jso.jl
cp("_assets/jso.png", "_assets/something.png"; force=true)
print("No errors")
```

\output{./copy-jso.jl}

{{ rfig something.png JSO logo - testing that rfig works }}