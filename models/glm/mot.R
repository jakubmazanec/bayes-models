source("modules/index.R")


# defining the data
rawData <- read.spss('data/data-mot.sav', to.data.frame = TRUE)

data <- list()
data$trial <- rawData$success
data$trialCount <- length(data$trial)
data$subject <- as.array(as.numeric(factor(rawData$userId)))
data$nSubjects <- length(unique(data$subject))
data$nTargets <- rawData$nTargets
data$saliencyRatio <- rawData$saliencyRatio
data$canvasSize <- rawData$canvasSize

# fit model
modelFit <- stan(file = 'models/glm/mot.stan',
            data = data,
            warmup = 1000,
            iter = 5000,
            chains = 4,
            thin = 2,
            open_progress = TRUE)

# diagnostics plot
plot.alphaSubject <- ggs(modelFit, family = "alphaSubject")
plot.betaNTargets <- ggs(modelFit, family = "betaNTargets")
plot.betaSaliencyRatio <- ggs(modelFit, family = "betaSaliencyRatio")
plot.plot.betaCanvasSize <- ggs(modelFit, family = "betaCanvasSize")
plot.betaNTargetsAndSaliencyRatio <- ggs(modelFit, family = "betaNTargetsAndSaliencyRatio")

ggmcmc(plot.alphaSubject, file = "output/glm/ggmcmc-plot_glm-mot_alphaSubject.pdf")
ggmcmc(plot.betaNTargets, file = "output/glm/ggmcmc-plot_glm-mot_betaNTargets.pdf")
ggmcmc(plot.betaSaliencyRatio, file = "output/glm/ggmcmc-plot_glm-mot_betaSaliencyRatio.pdf")
ggmcmc(plot.betaCanvasSize, file = "output/glm/ggmcmc-plot_glm-mot_betaCanvasSize.pdf")
ggmcmc(plot.betaNTargetsAndSaliencyRatio, file = "output/glm/ggmcmc-plot_glm-mot_betaNTargetsAndSaliencyRatio.pdf")

# parameters
samples <- extractSamples(modelFit)

parameters <- list();
parameters$betaNTargets <- summarizeSamples(samples$betaNTargets)[c("mean", "hdiLower", "hdiUpper")]
parameters$betaSaliencyRatio <- summarizeSamples(samples$betaSaliencyRatio)[c("mean", "hdiLower", "hdiUpper")]
parameters$betaCanvasSize <- summarizeSamples(samples$betaCanvasSize)[c("mean", "hdiLower", "hdiUpper")]
parameters$betaNTargetsAndSaliencyRatio <- summarizeSamples(samples$betaNTargetsAndSaliencyRatio)[c("mean", "hdiLower", "hdiUpper")]
parameters$alphaSubjects <- c(1:dim(samples$alphaSubject)[1])

for (i in 1:length(parameters$alphaSubjects)) {
  parameters$alphaSubjects[i] = summarizeSamples(samples$alphaSubject[i,])["mean"]
}

# posterior predictive check
residuals <- c(1:data$trialCount)

for (i in 1:length(residuals)) {
  residuals[i] <- data$trial[i] - mean(samples$predictedTrial[i,])
}

# odds ratios
oddsRatios <- list()
oddsRatios$betaNTargets <- exp(parameters$betaNTargets)
oddsRatios$betaSaliencyRatio <- exp(parameters$betaSaliencyRatio)
oddsRatios$betaCanvasSize <- exp(parameters$betaCanvasSize)
oddsRatios$betaNTargetsAndSaliencyRatio <- exp(parameters$betaNTargetsAndSaliencyRatio)

# plots
plot(density(residuals), main = "Trial minus mean of predicted trials", xlab = "Residual")
