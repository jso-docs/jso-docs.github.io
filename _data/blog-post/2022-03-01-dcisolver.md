# New package: DCISolver.jl

We are very happy to announce the publication in JOSS of the paper **DCISolver.jl: A Julia Solver for Nonlinear Optimization using Dynamic Control of Infeasibility**. It is accessible in open access [here](https://joss.theoj.org/papers/10.21105/joss.03991).

`DCISolver.jl` is a new pure Julia implementation of the Dynamic Control of Infeasibility method (DCI), introduced by Bielschowsky and Gomes in 2008, for solving the equality-constrained nonlinear optimization problem
\begin{equation}
    \underset{x \in \mathbb{R}^n}{\text{minimize}} \quad f(x) \quad \text{subject to} \quad h(x) = 0,
\end{equation}
where  $f:\mathbb{R}^n \rightarrow \mathbb{R}$ and  $h:\mathbb{R}^n \rightarrow \mathbb{R}^m$ are twice continuously differentiable.
DCI is an iterative method that aims to compute a local minimum using first and second-order derivatives.
Our initial motivation for developing `DCISolver.jl` is to solve PDE-constrained optimization problems, many of which have equality constraints only.

`DCISolver.jl` is built upon the JuliaSmoothOptimizers (JSO) tools, and takes as input an `AbstractNLPModel`, JSO's general model API defined in [`NLPModels.jl`](https://github.com/JuliaSmoothOptimizers/NLPModels.jl), a flexible data type to evaluate objective and constraints, their derivatives, and to provide any information that a solver might request from a model. The user can hand-code derivatives, use automatic differentiation, or use JSO-interfaces to classical mathematical optimization modeling languages such as [AMPL](https://github.com/JuliaSmoothOptimizers/AmplNLReader.jl), [CUTEst](https://github.com/JuliaSmoothOptimizers/CUTEst.jl), or [JuMP](https://github.com/JuliaSmoothOptimizers/NLPModelsJuMP.jl).

We refer to the [documentation](https://juliasmoothoptimizers.github.io/DCISolver.jl/v0.2/) and [tutorials](https://jso-docs.github.io/) for examples and benchmarks.

## Example

```julia
using DCISolver, ADNLPModels

# Rosenbrock
nlp = ADNLPModel(x -> 100 * (x[2] - x[1]^2)^2 + (x[1] - 1)^2, [-1.2; 1.0])
stats = dci(nlp)

# Constrained
nlp = ADNLPModel(x -> 100 * (x[2] - x[1]^2)^2 + (x[1] - 1)^2, [-1.2; 1.0],
                 x->[x[1] * x[2] - 1], [0.0], [0.0])
stats = dci(nlp)
```

## References

> Bielschowsky, R. H., & Gomes, F. A.
> Dynamic control of infeasibility in equality constrained optimization.
> SIAM Journal on Optimization, 19(3), 1299-1325 (2008).
> [10.1007/s10589-020-00201-2](https://doi.org/10.1007/s10589-020-00201-2)
