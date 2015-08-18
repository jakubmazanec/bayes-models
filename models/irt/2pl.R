source("modules/index.R")

# defining the data
source("data/irt-2pl-1000(10)x20.R")

data <- list()
data$personCount <- length(dataRaw.abilities)
data$itemCount <- length(dataRaw.difficulties)
data$responses <- dataRaw.responses
data$responseCount <- length(data$responses)
data$itemIds <- dataRaw.itemIds
data$personIds <- dataRaw.subjectIds

# fit model
modelFit <- fitModel('models/irt/2pl.stan',
                     data = data,
                     burnin = 200,
                     samples = 1000,
                     thinning = 2)

# diagnostics plots
generateDiagnosticPlots(modelFit, dir = "output/irt", parameters = "difficult")
generateDiagnosticPlots(modelFit, dir = "output/irt", parameters = "abilit")
generateDiagnosticPlots(modelFit, dir = "output/irt", parameters = "discrimination")

# parameters
samples <- extractSamples(modelFit)

parameters <- list();
parameters$difficultyVariance <- summarizeSamples(samples$difficultyVariance)[c("mean")]
parameters$discriminationVariance <- summarizeSamples(samples$discriminationVariance)[c("mean")]
parameters$abilities <- c(1:dim(samples$abilities)[1])
parameters$difficulties <- c(1:dim(samples$difficulties)[1])
parameters$discriminations <- c(1:dim(samples$discriminations)[1])

for (i in 1:length(parameters$abilities)) {
  parameters$abilities[i] = summarizeSamples(samples$abilities[i,])[c("mean")]
}

for (i in 1:length(parameters$difficulties)) {
  parameters$difficulties[i] = summarizeSamples(samples$difficulties[i,])[c("mean")]
}

for (i in 1:length(parameters$discriminations)) {
  parameters$discriminations[i] = summarizeSamples(samples$discriminations[i,])[c("mean")]
}

# differences from true values
mean(sqrt((parameters$difficulties - dataRaw.difficulties) ^ 2))
mean(sqrt((parameters$discriminations - dataRaw.discriminations) ^ 2))
mean(sqrt((parameters$abilities - dataRaw.abilities) ^ 2))
