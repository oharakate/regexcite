#############################################################################
# Script in which to learn about writing an R package
# Kate O'Hara
# 13-11-2025
#############################################################################

# Note that this script started life in learn_package and gets moved into the
# regexcite toy package at line 60.
# In practice I guess we'd just use the console to run lines to 23 and then
# move to a jotter file to start working.
# Remember to load devtools again in the new package.

#### Setup ####
# install.packages("devtools")

library(devtools)
package?devtools
packageVersion("devtools")
# requires usethis ^

library(gitcreds)

# use Git
# May need to do this bit first, making a token:
# library(gitcreds)
create_github_token()
gitcreds_set()

# The gitHUB command was the one for connecting to github.
# I don't think I need to do this each time.
# use_git()
# use_github()

####

# I am going to work through this:
# https://r-pkgs.org/whole-game.html

#### Creating the package ####
create_package("/Users/kateohara/Library/CloudStorage/OneDrive-UniversityofStirling/0_resources/0_R_resources/regexcite")

####

#### Getting the function ready ####
# I think at this point we are going to go and work in the new instance of
# RStudio which opened with the package in...

# Wait, first here is some stuff from the book.
# We can easily split a single string into many parts using base R:
# Make a string:
x <- "alfa,bravo,charlie,delta"
strsplit(x, split = ",")
# Have a look at the structure of what is created:
str(strsplit(x, split = ","))
# Remember that str() is for STRUCTURE.
?str()
# It made a list of length 1 with four characters?
# Book says, and I'm not totally sure I fully understand yet:
# The shape of this return value often surprises people or, at least,
# inconveniences them. The input is a character vector of length one and the
# output is a list of length one. This makes total sense in light of R’s
# fundamental tendency towards vectorization. But sometimes it’s still a bit of
# a bummer. Often you know that your input is morally a scalar, i.e. it’s just
# a single string, and really want the output to be the character vector of its
# parts.

# We might then want to unlist this somehow, e.g.:
unlist(strsplit(x, split = ","))
strsplit(x, split = ",")[[1]]
# I think the second function explicitly calls item 1 of the list.
# It is going to be the basis for the inaugural function of regexcite.
strsplit1 <- function(x, split) {
  strsplit(x, split = split)[[1]]
}

####

#### Putting the function somewhere in the package ####

# OK, going to take that function now and save it in a .R file in the R/
# subdirectory of the package.

use_r("a_test")
# OK, that create a_test.R in the subdirectory R in THIS project. So I guess
# I want to have a working document like this in my package folder and work
# there. So at this point, I'm going to copy this across.

####

#### Loading the package with load_all() ####

# load_all() makes the script available for experimentation...
# Make sure devtools is loaded
library(devtools)
load_all()

# Now we can call it in here and see how it works...
# Make the string to play with:
x <- "alfa,bravo,charlie,delta"
strsplit1(x, split = ",")
# What structure does it have?
str(strsplit1(x, split = ","))
# I think that means a character vector of length 4?

# Book says...Note that load_all() has made the strsplit1() function available,
# although it does not exist in the global environment.
# This code checks if it exists in the global encironment I think:
exists("strsplit1", where = globalenv(), inherits = FALSE)
# False is the desired answer.

# Come back and read about the whole point of load_all() in the book when
# required.

# To review what we’ve done so far:

# We wrote our first function, strsplit1(), to split a string into a character
# vector (not a list containing a character vector).
# We used load_all() to quickly make this function available for interactive
# use, as if we’d built and installed regexcite and attached it via
# library(regexcite).
####


#### Commit strsplit1() ####
# The instructions are to use your own preferred method to ocmmit the new
# R/strsplit1.R file.
# I've managed to commit my changes here, but they don't seem to be connected
# my github.
# I followed instructions here:
# https://rfortherestofus.com/2021/02/how-to-use-git-github-with-r

# This worked and the token will expire 13/11/2026 - let's see what happens.
library(gitcreds)
create_github_token()
gitcreds_set()

# I ran use_github() NOTE THE DIFFERENCE...
# And this time was able to both commit and push to Github.
# Have edited above.

####


#### Checking if whole package works with check() ####

# R CMD check, executed in the shell, is the gold standard for checking that
# an R package is in full working order. check() is a convenient way to run
# this without leaving your R session.
check()
# It doesn't know what to do with "notebook.R".
# I can add it to .Rbuildignore or, better, put it in a dev folder and
# ignore that. Moved it.
use_build_ignore("dev/")


####


#### Edit DESCRIPTION #####
# This is how I added an ORCID:
# Authors@R:
# person("Kate", "O'Hara", , "k.a.ohara@stir.ac.uk", role = c("aut", "cre"),
       # comment = c(ORCID = "https://orcid.org/0000-0001-9991-108X"))
####

#### document() ####

# I had to go into the function and, inside it, use the menus to choose
# Code > Insert roxygen skeleton
# and put in the bits.

# Next we use document() to trigger the conversion of that roxygen markdown
# entry into man/strsplit1.Rd :
document()
# To see it:
?strsplit1
# If that doesn't work, call load_all() again first.
# Note that it says development documentation.

####




#### NAMESPACE changes ####

# At this point, we also had a look at the NAMESPACE file, which got updated.
# I think basically the export() command for the function needs to be in there
# so that the function is available when the user attaches regexcite.

####

#### Use check() again ####
check()
# I have a note about the timestamp. Gemini LLM assures me this should be
# fine and not affect the package creation. Can revisit this.
####


####


#### install() ####

# We can try installing it now.
install()
# That worked and now we are going to restart the session and try the thing.
# Restarting session here.
library(regexcite)
# Worked.
x <- "alfa,bravo,charlie,delta"
strsplit1(x, split = ",")
thing <- strsplit1(x, split = ",")
str(thing)
# Seems good.

####




#### use_testthat() ####

# Now we are going to formalize our testing as a unit test.
# It means we express a concrete expectation about the correct strsplit1()
# result for a specific input.

# To declare our intent to write unit tests:
use_testthat()

# Now we make a test for this specifically.
# We are going to call it, but possibly it would know what is active...
# Unsure about this.
use_test("strsplit1")
# OK, that made a new R file in /tests/.
# Then I ran the code I put in that file.
# I had to run load_all() to get that to work.

####


#### use_package() ####

# We are going to try using another package in this one. stringr
use_package("stringr")
# So a new version of the command. Put the following into strsplit1.R:
# str_split_one <-  function(string, pattern, n = Inf) {
#   stopifnot(is.character(string), length(string) <= 1)
#   if (length(string) == 1) {
#     stringr::str_split(string = string, pattern = pattern, n = n) [[1]]
#   } else
#     character()
# }
# First we change the name of the old function script with this special
# command which update the associated test files too.
rename_files("strsplit1", "str_split_one")
# Then we made changes in the test file to reflect new functionality.
# We need to run document() again.
document()
load_all()
str_split_one("a, b, c", pattern = ", ")
# Done
####


####
