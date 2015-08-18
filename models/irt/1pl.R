source("modules/index.R")

# defining the data
source("data/irt-1pl-1000(1)x20.R")

data <- list()
data$personCount <- length(dataRaw.abilities)
data$itemCount <- length(dataRaw.difficulties)
data$responses <- dataRaw.responses
data$responseCount <- length(data$responses)
data$itemIds <- dataRaw.itemIds
data$personIds <- dataRaw.subjectIds

# fit model
modelFit <- fitModel('models/irt/1pl.stan',
                     data = data,
                     burnin = 500,
                     samples = 1000,
                     thinning = 1)

# diagnostics plots
generateDiagnosticPlots(modelFit, dir = "output/irt", parameters = "difficult")
generateDiagnosticPlots(modelFit, dir = "output/irt", parameters = "abilit")

# parameters
samples <- extractSamples(modelFit)

parameters <- list();
parameters$difficultyVariance <- summarizeSamples(samples$difficultyVariance)[c("mean")]
parameters$abilities <- c(1:dim(samples$abilities)[1])
parameters$difficulties <- c(1:dim(samples$difficulties)[1])

for (i in 1:length(parameters$abilities)) {
  parameters$abilities[i] = summarizeSamples(samples$abilities[i,])[c("mean")]
}

for (i in 1:length(parameters$difficulties)) {
  parameters$difficulties[i] = summarizeSamples(samples$difficulties[i,])[c("mean")]
}

# differences from true values
mean(sqrt((parameters$difficulties - dataRaw.difficulties) ^ 2))
mean(sqrt((parameters$abilities - dataRaw.abilities) ^ 2))
