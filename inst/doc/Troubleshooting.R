## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----example1_1---------------------------------------------------------------
require(implied)

my_odds <- rbind(c(1.15, 5, 10, 25),
                c(4.1, 4.2, 8.2, 2.1),
                c(3.8, 4.7, 5.9, 2.3))

my_probs <- implied_probabilities(my_odds, method = 'additive')


## ----example1_2---------------------------------------------------------------
my_probs$problematic

# Can also just list the line numbers
which(my_probs$problematic)


## ----example1_3---------------------------------------------------------------
my_probs$probabilities

