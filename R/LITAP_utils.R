na_omit <- function(x) return(x[!is.na(x)])

#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL

max_na <- function(x) {
  if(sum(!is.na(x)) > 0) y <- max(x, na.rm = TRUE) else y <- as.numeric(NA)
  y
}

write_log <- function(..., log) {
  if(log != FALSE) write(paste0(...), file = log, append = TRUE)
}

write_start <- function(task, time, log) {
  write_log("Started ", task, " at: ", time, log = log)
}

write_time <- function(time, log) {
  write_log("  Total time: ",
            round(difftime(Sys.time(), time, units = "min"), 2),
            log = log)
}

announce <- function(task, quiet) {
  if(!quiet) message(toupper(task))
}

skip_task <- function(task, log_file, quiet) {
  if(!quiet) message("SKIPPING ", toupper(task))
  write_log("Skipping ", task, log = log_file)
}

check_out_format <- function(out_format){
  if(!out_format %in% c("csv", "rds", "dbf")) {
    stop("'out_format' must be one of 'csv', 'rds', or 'dbf'", call. = FALSE)
  }
}

check_resume <- function(resume, end, resume_options) {
  if(!resume %in% resume_options | !end %in% resume_options) {
    stop("resume/end must be one of 'NULL' (no resume), '",
         paste0(resume_options[-1], collapse = "', '"), "'", call. = FALSE)
  }
}

check_grid <- function(grid) {
  if(missing(grid) || !is.numeric(grid) || grid < 0){
    stop("'grid' must be a number greater than 0", call. = FALSE)
  }
}

run_time <- function(start, log_file, quiet) {
  stop <- Sys.time()
  runtime <- round(difftime(stop, start, units = "min"), 2)
  if(!quiet) message("Run took: ", runtime, " min")
  write_log("\nTotal run time: ", runtime, " min", log = log_file)
}

