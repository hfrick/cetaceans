#' Cetaceans Living in Captivity in the USA
#'
#' A data set containing whales and dolphins that spent some period of time
#' captive in the USA between 1938 and May 7, 2017. This is based on a
#' [Tidy Tuesday data set](https://github.com/rfordatascience/tidytuesday/tree/master/data/2018/2018-12-18),
#' originally assembled by [The Pudding](https://github.com/the-pudding/data/tree/master/cetaceans).
#'
#' @format A data frame with `r nrow(cetaceans)` rows and `r ncol(cetaceans)` columns.
#' \describe{
#'   \item{age}{Age of an individual animal in years.}
#'   \item{event}{Status indicator. `1` if the animal has died,
#'     `0` otherwise.}
#'   \item{species}{The common name for an individual animal's species.}
#'   \item{sex}{An individual animal's sex (`"M"`= male, `"F"`= female,
#'     `"U"` = unknown).}
#'   \item{birth_decade}{The decade in which an individual animal was born.}
#'   \item{born_in_captivity}{Whether an individual animal was born in captivity.}
#'   \item{time_in_captivity}{Share of their lifetime an individual animal has
#'     spent in captivity.}
#'   \item{origin_location}{The location that an individual animal originated from.
#'     For captured/rescued animals this is an approximate location in the ocean
#'    (e.g., Atlantic Ocean or Gulf of Mexico), but for animals born in captivity
#'    it will list the facility where the animal was born.}
#'   \item{transfers}{Number of times an individual animal has been transferred
#'     between facilities.}
#'   \item{current_location}{The location where a living animal currently
#'     resides (as of May 7, 2017) or the last location where an animal lived
#'     before it died.}
#' }
#' @source \url{https://github.com/rfordatascience/tidytuesday/blob/d0ada7e19f4dee492368bd7e23994f84810a275c/data/2018/2018-12-18/allCetaceanData.csv}
"cetaceans"
