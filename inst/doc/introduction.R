## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----basic--------------------------------------------------------------------

library(implied)

# One column for each outcome, one row for each race or match.
my_odds <- rbind(c(4.20, 3.70, 1.95),
                 c(2.45, 3.70, 2.90),
                 c(2.05, 3.20, 3.80))
colnames(my_odds) <- c('Home', 'Draw', 'Away')

res1 <- implied_probabilities(my_odds)

res1$probabilities

res1$margin


## ----wpo----------------------------------------------------------------------
res2 <- implied_probabilities(my_odds, method = 'wpo')

res2$probabilities

# The margins applied to each outcome.
res2$specific_margins

## ----or-----------------------------------------------------------------------
res3 <- implied_probabilities(my_odds, method = 'or')

res3$probabilities

# The odds ratios converting the proper probablities to bookmaker probabilities.
res3$odds_ratios

## ----power--------------------------------------------------------------------
res4 <- implied_probabilities(my_odds, method = 'power')

res4$probabilities

# The inverse exponents (n) used to convert the proper probablities to bookmaker probabilities.
res4$exponents

## ----additive1----------------------------------------------------------------

res5 <- implied_probabilities(my_odds, method = 'additive')

res5$probabilities


## ----additive2----------------------------------------------------------------

my_odds2 <- t(matrix(1/c(0.870, 0.2, 0.1, 0.05, 0.02, 0.01)))
colnames(my_odds2) <- paste('X', 1:6, sep='')

res6 <- implied_probabilities(my_odds2, method = 'additive')

res6$probabilities


## ----shin---------------------------------------------------------------------
res7 <- implied_probabilities(my_odds, method = 'shin')

res7$probabilities

# The estimated proportion of inside traders.
res7$zvalues

## ----bb-----------------------------------------------------------------------
# Balanced books
res8 <- implied_probabilities(my_odds, method = 'bb')

res8$probabilities

# The estimated proportion of inside traders.
res8$zvalues

## ----jsd----------------------------------------------------------------------
# Balanced books
res9 <- implied_probabilities(my_odds, method = 'jsd')

res9$probabilities

# The estimated noise (JS distance)
res9$distance

## ----target_prob--------------------------------------------------------------
# Example odds.
odds_reach_final <- c(1.6, 2.63, 3.3, 3.7, 5.6, 7.1, 12.5, 16.5, 25)

res10 <- implied_probabilities(odds_reach_final, method = 'or', target_probability = 2)

res10$probabilities

sum(res10$probabilities)


## ----imp_odds1----------------------------------------------------------------

res_odds1 <- implied_odds(res4$probabilities[1,], 
                     margin = res4$margin[1], 
                     method = 'power')

res_odds1$odds

# The exponents.
res_odds1$exponents

# Compare to the exponent from the odds-to-probability conversion.
res4$exponents[1]


