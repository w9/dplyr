.onLoad <- function(libname, pkgname) {
  op <- options()
  op.dplyr <- list(
    dplyr.strict_sql = FALSE,
<<<<<<< HEAD
    dplyr.print_min = 5L,
=======
    dplyr.print_min = 10L,
>>>>>>> upstream/master
    dplyr.print_max = 20L
  )
  toset <- !(names(op.dplyr) %in% names(op))
  if(any(toset)) options(op.dplyr[toset])

  invisible()
}

.onAttach <- function(libname, pkgname) {

  setHook(packageEvent("plyr", "attach"), function(...) {
    packageStartupMessage(rule())
    packageStartupMessage("You have loaded plyr after dplyr - this is likely ",
      "to cause problems.\nIf you need functions from both plyr and dplyr, ",
      "please load plyr first, then dplyr:\nlibrary(plyr); library(dplyr)")
    packageStartupMessage(rule())
  })
}
