source("modules/index.R")
source("models/acm-rasch/modules/testMatrix.R")

testDoubleCancellation = function (n, N) {
  nMatrixes <- submatrixes(n, c(3, 3))
  totalNMatrixes <- submatrixes(N, c(3, 3))
  cancellationFails <- zeros(n)
  cancellationTests <- zeros(n)
  
  # single cancellation
  for (k in 1:length(nMatrixes)) {
    cat("Testing matrix... (", k, " of ", length(nMatrixes), ")\n")
    i <- nMatrixes[[k]]$i
    j <- nMatrixes[[k]]$j
    result <- testMatrix(nMatrixes[[k]]$matrix, totalNMatrixes[[k]]$matrix, "double")
    
    cancellationFails[i:(i + 2), j:(j + 2)] <- cancellationFails[i:(i + 2), j:(j + 2)] + result$fails * (1 - result$notTestable);
    cancellationTests[i:(i + 2), j:(j + 2)] <- cancellationTests[i:(i + 2), j:(j + 2)] + matrix(1, 3, 3) * (1 - result$notTestable);
  }
  
  failRate <- cancellationFails / cancellationTests
  
  sum <- 0
  divider <- 0
  
  for (i in 1:dim(failRate)[1]) for (j in 1:dim(failRate)[2]) {
    if (is.finite(failRate[i, j])) {
      sum <- sum + failRate[i, j] * N[i, j]
      divider <- divider + N[i, j]
    }
  }
  
  return (list(tests = cancellationTests,
               fails = cancellationFails,
               failRate = failRate,
               meanFailRate = mean(as.vector(failRate)[!is.na(as.vector(failRate))]),
               weightedMeanFailRate = sum / divider))
}