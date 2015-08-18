generateDiagnosticPlots = function (fit, dir = "", parameters = NA) {
	require("ggmcmc")
	
  plot <- ggs(fit, family = parameters)
  
  ggmcmc(plot, file = paste(dir, "/plot_", modelFit@model_name, "_", parameters, "_density-caterpillar.pdf", 
                            sep = ""), plot = "density caterpillar")
  ggmcmc(plot, file = paste(dir, "/plot_", modelFit@model_name, "_", parameters, "_traceplot-running-compare-partial.pdf", 
                            sep = ""), plot = "traceplot running compare_partial")
  ggmcmc(plot, file = paste(dir, "/plot_", modelFit@model_name, "_", parameters, "_autocorrelation-crosscorrelation.pdf", 
                            sep = ""), plot = "autocorrelation crosscorrelation")
  ggmcmc(plot, file = paste(dir, "/plot_", modelFit@model_name, "_", parameters, "_rhat-geweke.pdf", 
                            sep = ""), plot = "Rhat geweke")
}