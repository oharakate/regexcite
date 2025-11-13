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

#### Loading the package with load_all()

# load_all() makes the script available for experimentation...
# Make sure devtools is loaded
library(devtools)
load_all()
