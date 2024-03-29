% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/emoa_operators.R
\name{mutSubforestMST}
\alias{mutSubforestMST}
\title{Forest-mutator for edge list representation.}
\usage{
mutSubforestMST(ind, sigma = ncol(ind), scalarize = FALSE, instance = NULL)
}
\arguments{
\item{ind}{[\code{matrix(2, m)}]\cr
Matrix of edges (each column is one edge).}

\item{sigma}{[\code{integer()}]\cr
Upper bound for number of dropped edges.}

\item{scalarize}{[\code{logical(1)}]\cr
Should a scalarized version of the the subproblem be solved?
If \code{TRUE}, a random weight \eqn{\lambda \in [0,1]} is sampled
from a \code{U[0, 1]}-distribution. Next, a weighted sum
scalarization \eqn{\lambda \cdot c_1 + (1 - \lambda) \cdot c_2}
of the subproblem is solved.
Default is \code{FALSE}, i.e., the single-objective subproblem is
solved. The objective to optimize for is sampled with equal probability.}

\item{instance}{[\code{\link[grapherator]{grapherator}}]\cr
Multi-objective graph.}
}
\value{
[\code{matrix(2, m)}] Mutated edge list.
}
\description{
\code{mutForestMST} drops k edges randomly. In consequence the
tree is decomposed into k+1 subtrees (forest). Now the operator reconnects the
subtrees by constructing a minimum spanning tree between the components.
}
\seealso{
Evolutionary multi-objective algorithm \code{\link{mcMSTEmoaBG}}

Other mcMST EMOA mutators: 
\code{\link{mutEdgeExchange}()},
\code{\link{mutKEdgeExchange}()},
\code{\link{mutSubgraphMST}()},
\code{\link{mutUniformPruefer}()}
}
\concept{mcMST EMOA mutators}
