fitModel = function (model, data, burnin = 200, samples = 1000, thinning = 1, chains = 4) {
  warmup <- burnin * thinning
  iterations <- warmup + samples * thinning
  
  fit <- stan(file = model,
              data = data,
              warmup = warmup,
              iter = iterations,
              chains = chains,
              thin = thinning,
              open_progress = TRUE)
    
  return (fit);
}