# Should it have any comments in it?
# Comments are fine, but we are going to learn to use the roxygen
# formatting for the following kind of info...

# This function is like strsplit, but returns an unlisted output.

# This is the roxygen2 part, for documentation.



# This is the function.
#' Split a string
#'
#' @param string A character vector with, at most, one element.
#' @inheritParams stringr::str_split
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' x <- "alfa,braveo,charlie,delta"
#' str_split_one(x, pattern = ",")
#' str_split_one(x, pattern = ",", n = 2)
#'
#' y <- "192.168.0.1"
#' str_split_one(y, pattern = stringr::fixed("."))

str_split_one <-  function(string, pattern, n = Inf) {
  stopifnot(is.character(string), length(string) <= 1)
  if (length(string) == 1) {
    stringr::str_split(string = string, pattern = pattern, n = n) [[1]]
  } else
    character()
}

# Old:
# strsplit1 <- function(x, split) {
#   # This is the roxygen2 part, for documentation.
#   # I had to use the menus to do Code > Insert roxygen skeleton...
#   strsplit(x, split = split)[[1]]
# }
