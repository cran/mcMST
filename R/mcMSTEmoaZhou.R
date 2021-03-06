#' @title Pruefer-EMOA for the multi-objective MST problem.
#'
#' @description Evolutionary multi-objective algorithm to solve the
#' multi-objective minimum spanning tree problem. The algorithm adopts the
#' so-called Pruefer-number as the encoding for spanning trees. A Pruefer-number
#' for a graph with nodes \eqn{V = \{1, \ldots, n\}} is a sequence of \eqn{n - 2}
#' numbers from \eqn{V}. Cayleys theorem states, that a complete graph width n nodes
#' has exactly \eqn{n^{n-2}} spanning trees.
#' The algorithm uses mutation only: each component of an individual is replaced
#' uniformly at random with another node number from the node set.
#'
#' @references Zhou, G. and Gen, M. Genetic Algorithm Approach on Multi-Criteria
#' Minimum Spanning Tree Problem. In: European Journal of Operational Research (1999).
#'
#' @param mut [\code{ecr_mutator}]\cr
#'   Mutation operator.
#'   Defaults to \code{\link{mutUniformPruefer}}, i.e., each digit of the Pruefer encoding
#'   is replaced with some probability with a random number from \eqn{V = \{1, \ldots, n\}}.
#' @inheritParams mcMSTEmoaBG
#' @template ret_ecrresult
#' @family mcMST EMOAs
#' @family mcMST algorithms
#' @seealso Mutator \code{\link{mutUniformPruefer}}
#' @export
mcMSTEmoaZhou = function(instance,
  mu, lambda = mu,
  mut = mutUniformPruefer,
  selMating = ecr::selSimple, selSurvival = ecr::selNondom,
  ref.point = NULL, max.iter = 100L) {

  force(instance)

  fitness.fun = function(pcode, instance) {
    edgelist = prueferToEdgeList(pcode)
    getWeight(instance, edgelist)
  }

  if (is.null(ref.point))
    ref.point = getReferencePoint(instance)

  # get number of nodes
  n = instance$n.nodes
  n.objectives = instance$n.weights

  # now generate an initial population of Pruefer-numbers/codes
  population = lapply(1:mu, function(i) {
    sample(1:n, n - 2L, replace = TRUE)
  })

  res = ecr(fitness.fun = fitness.fun, n.objectives = n.objectives,
    mu = mu, lambda = lambda, survival.strategy = "plus", representation = "custom",
    initial.solutions = population,
    survival.selector = selSurvival, parent.selector = selMating,
    mutator = mut, p.mut = 1,
    log.stats = list(fitness = list("HV" = list(
      fun = computeHV,
      pars = list(ref.point = ref.point)))),
    terminators = list(stopOnIters(max.iter)),
    instance = instance)
  return(res)
}
