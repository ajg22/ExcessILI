#' Helper function to format the results from excessCases
#'
#' This function extracts specific estimates produced in
#' \code{\link{excessCases}} and saves them in a multidimensional array.
#'
#' @param ds An object created by the function \code{\link{excessCases}}
#'
#' @param syndrome Character. For which syndrome should results be extracted?
#'   The name for this variable should match a syndrome provided to
#'   \code{\link{excessCases}}
#'
#' @param extract.quantity Which element of the output (e.g., 'lpi') from the
#'   output of excessCases do you want to extract. See the values in the help
#'   for \code{\link{excessCases}} to see the options.
#'
#' @return a multidimensional array with dimensions for time, age group, and
#'   geography (state, and sub-state)
#'
#' @export
excessExtract <- function(ds, syndrome, extract.quantity) {
    out.ds <-
      sapply(ds[[syndrome]],
             function(x) sapply(x, "[[", extract.quantity), simplify = "array")

    return(out.ds)
}
