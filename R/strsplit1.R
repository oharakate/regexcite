# Should it have any comments in it?
# Comments are fine, but we are going to learn to use the roxygen
# formatting for the following kind of info...

# This function is like strsplit, but returns an unlisted output.

strsplit1 <- function(x, split) {
  strsplit(x, split = split)[[1]]
}
