stanToCoda <- function (fit) {
  mcmc.list(lapply(1:ncol(fit), function (x) mcmc(as.array(fit)[,x,])))
}