#' Select objects from the global environment that match a pattern
#'
#' @description
#'
#' * [env_starts_with()]: Matches prefix.
#'
#' * [env_ends_with()]: Matches suffix.
#'
#' * [env_contains()]: Contains a literal string.
#'
#' * [env_matches()]: Matches a regular expression.
#'
#' * [env_num_range()]: Matches a numerical range like x01, x02, x03.
#'
#' @param match A character vector.
#' @param silent Whether to message assigned objects in console.
#' @param prefix A prefix that starts the numeric range.
#' @param range A sequence of integers, like 1:5.
#' @param ... Additional parameters passed to `grep()`
#'
#' @return a list
#'
#' @examples
#' \dontrun{
#' library(nycflights13)
#' data("airlines")
#' data("airports")
#' data("airmiles")
#' data("airquality")
#' air_dfs <- env_matches("^air")
#' names(air_dfs)
#' str(air_dfs, max.level = 1)
#' }
#' @export
env_matches <- function(match, silent = FALSE, ...) {
  env_obj_nms <- ls(globalenv())
  env_matches <- grep(match, env_obj_nms, value = TRUE, ...)
  env2list(env_matches, silent = silent)
}

#' @rdname env_matches
#' @export
env_starts_with <- function(match, silent = FALSE, ...) {
  env_obj_nms <- ls(globalenv())
  env_matches <- grep(paste0("^", match), env_obj_nms, value = TRUE, ...)
  env2list(env_matches, silent = silent)
}

#' @rdname env_matches
#' @export
env_ends_with <- function(match, silent = FALSE, ...) {
  env_obj_nms <- ls(globalenv())
  env_matches <- grep(paste0(match, "$"), env_obj_nms, value = TRUE, ...)
  env2list(env_matches, silent = silent)
}

#' @rdname env_matches
#' @export
env_contains <- function(match, silent = FALSE, ...) {
  env_obj_nms <- ls(globalenv())
  env_matches <- grep(match, env_obj_nms, value = TRUE, ...)
  env2list(env_matches, silent = silent)
}

#' @rdname env_matches
#' @export
env_num_range <- function(prefix, range, silent = FALSE, ...) {
  env_obj_nms <- ls(globalenv())
  match <- paste0(prefix, range, collapse = "|")
  env_matches <- grep(match, env_obj_nms, value = TRUE, ...)
  env2list(env_matches, silent = silent)
}

env2list <- function(x, silent) {
  out <- vector("list", length = length(x))
  names(out) <- x
  for (i in seq_along(x)) {
    if (!silent) message(paste(x[i], "assigned to output."))
    out[[i]] <- as.name(x[i])
  }
  lapply(out, function(x) eval(x))
}

