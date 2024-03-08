report <- data.frame(path = character(), size = numeric())

dir_size <- function(dir_path) {
  file_list <- list.files(path = dir_path, recursive = TRUE, full.names = TRUE)
  return(sum(file.info(file_list)$size))
}


sizeReport <- function(path, patt = ".*", dironly = FALSE, level = Inf){
  newlev <- level - 1
  elements <- c(path,list.files(path = path, pattern = patt, include.dirs = TRUE , recursive = newlev, full.names = TRUE))
  for (elem in elements) {
    if(newlev == -1){
      size <- dir_size(path)
      report <- rbind(report,  data.frame(path = path, size = size))
      break 
    } else {
      is_dir <- file.info(elem)$isdir
      if (!grepl(patt, basename(elem))) {
        next
      } 
      if (is_dir == TRUE) {
        size <- dir_size(elem)
      }
      if (dironly == TRUE && is_dir == FALSE){
        next
      } else if (is_dir == TRUE) {
        size <- dir_size(elem)
      } else {
        size <- file.info(elem)$size
      }
    }
    
    report <- rbind(report,  data.frame(path = elem, size = size))
  }
  return(report)
}

sizeReport(path = "../")
sizeReport(path = "../", level = 0)
sizeReport(path = "../", level = 1)
sizeReport(path = "../", level = 2)
sizeReport(path = "../", dironly = TRUE)
sizeReport(path = "../", patt = "png$")
sizeReport(path = "../", patt = "fig[1-4]")
sizeReport(path = "../", patt = "fig[^1-4]")
sizeReport(path = "../", patt = "proje[ck]t", dironly = TRUE, level = 1)



