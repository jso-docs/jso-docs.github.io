# WARNING: Not updated
# How to contribute with a tutorial or how-to guide.

## Bug reports and discussions

If you think you found a bug in any of our packages, feel free to open an issue at the specific GitHub repo.
If should be a link like `https://github.com/JuliaSmoothOptimizers/PACKAGE.jl`.

Focused suggestion and requests can also be opened as issues.
Before opening a pull request, start an issue or a discussion on the topic, please.

If you want to ask a question that is not suited for a bug report, feel free to start a discussion [here](https://github.com/JuliaSmoothOptimizers/Organization/discussions).
This forum is for general discussion, so questions about any of our packages are welcome.


1. Find out whether you're working on a tutorial or a how-to guide. See [here](https://documentation.divio.com) for more details.
2. Mention your plans of writing a tutorial/how-to guide, either in an issue, or on open a [discussion](https://github.com/JuliaSmoothOptimizers/Organization/discussions).
3. Write a `.jl` script with comments. The comments will be parsed. Look into [_literate](_literate/) for examples.
4. Write the corresonding `.md` file. Look into [pages](pages/).
5. To compile, activate this folder, run `using Franklin`, then `serve()`.
6. Create your pull request.