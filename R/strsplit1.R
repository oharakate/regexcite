# Should it have any comments in it?
# Comments are fine, but we are going to learn to use the roxygen
# formatting for the following kind of info...

# This function is like strsplit, but returns an unlisted output.

# This is the roxygen2 part, for documentation.



# This is the function.
#' Split a string
#'
#' @param x A character vector with one element.
#' @param split What to split upon.
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' x <- "alfa,braveo,charlie,delta"
#' strsplit1(x, split = ",")
#'
strsplit1 <- function(x, split) {
  # This is the roxygen2 part, for documentation.
  # I had to use the menus to do Code > Insert roxygen skeleton...


  strsplit(x, split = split)[[1]]
}
