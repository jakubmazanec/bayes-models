source("modules/index.R")

# defining the data
source("data/data-fa.R")

# standardize data
for (i in 1:20) {
  # data[, i] <- (data[, i] - 2.5) / 1.5
  #data[, i] <- (data[, i] - 1) / 3
  # data[, i] <- (data[, i] - 1) / 3
}


# fit model
modelFit <- fitModel('models/fa/fa.stan',
                     data = list("response" = data,
                                 "personCount" = dim(data)[1],
                                 "indicatorCount" = dim(data)[2],
                                 "factorCount" = 2),
                     burnin = 500,
                     samples = 4000,
                     thinning = 1,
                     chains = 1)

# diagnostics plots
generateDiagnosticPlots(modelFit, dir = "output/fa", parameters = "intercept")
generateDiagnosticPlots(modelFit, dir = "output/fa", parameters = "factorLoading")
generateDiagnosticPlots(modelFit, dir = "output/fa", parameters = "errorVariance")
generateDiagnosticPlots(modelFit, dir = "output/fa", parameters = "factorScore")

# parameters
samples <- extractSamples(modelFit)

parameters <- list()
parameters$intercept <- matrix(0, dim(samples$intercept)[1], 3)
parameters$errorVariance <- matrix(0, dim(samples$errorVariance)[1], 3)
parameters$factorLoading <- array(0, c(dim(samples$factorLoading)[1], dim(samples$factorLoading)[2], 3))
parameters$factorScore <- array(0, c(dim(samples$factorScore)[1], dim(samples$factorScore)[2], 3))

for (i in 1:dim(parameters$intercept)[1]) {
  parameters$intercept[i,] = summarizeSamples(samples$intercept[i,])[c("mean", "hdiLower", "hdiUpper")]
}

for (i in 1:dim(parameters$errorVariance)[1]) {
  parameters$errorVariance[i,] = summarizeSamples(samples$errorVariance[i,])[c("mean", "hdiLower", "hdiUpper")]
}

for (i in 1:dim(parameters$factorLoading)[1]) for (j in 1:dim(parameters$factorLoading)[2]) {
  parameters$factorLoading[i, j,] = summarizeSamples(samples$factorLoading[i, j,])[c("mean", "hdiLower", "hdiUpper")]
}

for (i in 1:dim(parameters$factorScore)[1]) for (j in 1:dim(parameters$factorScore)[2]) {
  parameters$factorScore[i, j,] = summarizeSamples(samples$factorScore[i, j,])[c("mean", "hdiLower", "hdiUpper")]
}
