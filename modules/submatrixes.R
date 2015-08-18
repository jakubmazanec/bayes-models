submatrixes = function(matrix, dimensions) {
  matrixes <- list()
  rows <- dimensions[1]
  columns <- dimensions[2]
  
  for (i in 1:(dim(matrix)[1] - rows + 1)) for (j in 1:(dim(matrix)[2] - columns + 1)) {
    matrixes[[j + (i - 1) * (dim(matrix)[2] - rows + 1)]] <- list(matrix = matrix[i:(i + rows - 1), j:(j + columns - 1)],
                                                                  i = i,
                                                                  j = j)
  }
  
  return (matrixes)
}