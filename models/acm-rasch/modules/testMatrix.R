source("modules/summarizeSamples.R")

testMatrix = function(n, N, test = "single") {
  getInitialValues = function(data) {
    initialValues <- data
    index <- matrix(1:3, 3, 3, byrow = TRUE) + matrix(1:3, 3, 3)
    hold <- sort(as.numeric(initialValues))
    counter <- 1
    
    for (i in unique(as.numeric(index))) {
      grep(paste("^", i, "$", sep = ""), index) -> index2
      stop.here <- length(index2)
      replace <- counter:(counter + stop.here - 1)
      initialValues[index2] <- hold[replace]
      counter <- max(replace) + 1
    }
    
    return (initialValues)
  }
  
  loglikelihood = function (x, size, probability) {
    return (x * log(probability) + (size - x) * log(1 - probability))
  }
  
  data.N <- N
  data.n <- n
  
  warmupCount = 1000
  iterationsCount = 5000
  thinning = 4
  credibleMass = c(0.025, 0.975)
  
  # initialize
  data.p <- data.n / data.N
  fullChain <- array(0, dim = c(3, 3, trunc(iterationsCount / thinning)))
  chain <- array(0, dim = c(3, 3, trunc((iterationsCount - warmupCount) / thinning)))
  initialValues <- getInitialValues(data.p)
  lastSamples <- initialValues
  lastLikelihoods <- zeros(initialValues)
  notTestable <- zeros(initialValues)
  
  for (i in 1:nrow(lastLikelihoods)) {
    for (j in 1:ncol(lastLikelihoods)) {
      lastLikelihoods[i, j] <- loglikelihood(data.n[i, j], data.N[i, j], initialValues[i, j])
    }
  }
  
#   print(data.n)
#   print(data.N)
#   print(initialValues)
#   print(lastLikelihoods)
  
  # iterate
  for (iterationIndex in 1:iterationsCount) {
    # cat(iterationIndex, "\n")
    for (i in 1:nrow(data.p)) for (j in 1:ncol(data.p)) {
      proposal.lowerBoundary.1 <- 0
      proposal.lowerBoundary.2 <- 0
      proposal.lowerBoundary.3 <- 0
      proposal.upperBoundary.1 <- 1
      proposal.upperBoundary.2 <- 1
      proposal.upperBoundary.3 <- 1
      
      # single cancellation
      if (test != "double") {
        if (j == 1) proposal.lowerBoundary.1 <- 0 else proposal.lowerBoundary.1 <- lastSamples[i, j - 1]
        if (i == 1) proposal.lowerBoundary.2 <- 0 else proposal.lowerBoundary.2 <- lastSamples[i - 1, j]
        if (j == ncol(data.p)) proposal.upperBoundary.1 <- 1 else proposal.upperBoundary.1 <- lastSamples[i, j + 1]
        if (i == nrow(data.p)) proposal.upperBoundary.2 <- 1 else proposal.upperBoundary.2 <- lastSamples[i + 1, j]
      }
      
      # double cancellation
      if (test == "double" | test == "both") {
        inequalityTest.1 <- as.logical(lastSamples[2, 1] < lastSamples[1, 2])
        inequalityTest.2 <- as.logical(lastSamples[3, 2] < lastSamples[2, 3])
        
        if (inequalityTest.1 == inequalityTest.2) {
          if (inequalityTest.1 & inequalityTest.2) {
            if (i == 1 & j == 3) {
              proposal.lowerBoundary.3 <- lastSamples[3, 1]
            }
            
            if (i == 3 & j == 1) {
              proposal.upperBoundary.3 <- lastSamples[1, 3]
            }
          }
          
          if (!inequalityTest.1 & !inequalityTest.2) {
            if (i == 3 & j == 1) {
              proposal.lowerBoundary.3 <- lastSamples[1, 3]
            }
            
            if (i == 1 & j == 3) {
              proposal.upperBoundary.3 <- lastSamples[3, 1]
            }
          }
        }
      }
      
      #now work everything out all nice like...
      proposal.lowerBoundary <- max(proposal.lowerBoundary.1, proposal.lowerBoundary.2, proposal.lowerBoundary.3)
      
      if (proposal.upperBoundary.3 > proposal.lowerBoundary) {
        proposal.upperBoundary <- min(proposal.upperBoundary.1, proposal.upperBoundary.2, proposal.upperBoundary.3) 
      } else {
        proposal.upperBoundary <- min(proposal.upperBoundary.1, proposal.upperBoundary.2)
      }
      
      if (proposal.upperBoundary < proposal.lowerBoundary) proposal.upperBoundary <- 1
      
      #sample new point
      proposal <- runif(1, proposal.lowerBoundary, proposal.upperBoundary)
      proposalLikelihood <- loglikelihood(data.n[i, j], data.N[i, j], proposal)
      
      #acceptance ratio
      acceptancePropability <- min(1, exp(proposalLikelihood - lastLikelihoods[i, j]))
      
      # cat(proposal.lowerBoundary, " ", proposal.upperBoundary, " ", proposal, "\n")
      
      if (is.finite(acceptancePropability) & runif(1) < acceptancePropability) {
        lastSamples[i, j] <- proposal
        lastLikelihoods[i, j] <- proposalLikelihood
      } else if(!is.finite(acceptancePropability)) {
        notTestable[i, j] <- 1
      }
    }
    
    if (iterationIndex %% thinning == 0) {
      
      if (iterationIndex > warmupCount) {
        chain[,,trunc((iterationIndex - warmupCount) / thinning)] <- lastSamples
      }
      
      fullChain[,,trunc(iterationIndex / thinning)] <- lastSamples
    }
  }
  
  # summarize samples
  highs <- lows <- means <- zeros(chain[,,1])
  
  for (i in 1:3) for (j in 1:3) {
    samplesSummary <- summarizeSamples(chain[i,j,])
    means[i, j] <- samplesSummary["mean"]
    lows[i, j] <- samplesSummary["hdiLower"]
    highs[i, j] <- samplesSummary["hdiUpper"]
  }
  
  return (list(samples = chain,
               means = means,
               hdiLowerBounds = lows,
               hdiUpperBounds = highs,
               fails = (data.p < lows | data.p > highs) * 1,
               notTestable = notTestable))
}


