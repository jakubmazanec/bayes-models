saveSamples <- function (parameters, filename) {
  require("jsonlite")
  
  fileConn <- file(filename)
  writeLines(toJSON(parameters, pretty = TRUE, digits = I(128)), fileConn)
  close(fileConn)
}

