% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graph.R
\name{mcGP}
\alias{mcGP}
\title{Generate a bare multi-objective graph.}
\usage{
mcGP(lower, upper)
}
\arguments{
\item{lower}{[\code{integer(1)}]\cr
Lower bounds for coordinates.}

\item{upper}{[\code{integer(1)}]\cr
Upper bounds for coordinates.}
}
\value{
[\code{mcGP}] Multi-objective graph problem.
}
\description{
This function generates a bare multi-objective weights. The generated
object does not contain nodes, edges or edge weights. It serves as a starting
point for the step-by-step construction of multi-objective graph problem.
}
\seealso{
Other graph generators: \code{\link{addCenters}},
  \code{\link{addCoordinates}}, \code{\link{addWeights}}
}
