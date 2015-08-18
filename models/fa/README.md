FA
==

## EFA

 - [efa.R](../blob/master/models/fa/efa.R)
 - [efa.stan](../blob/master/models/fa/efa.stan)


### Data

From PSY028 lecture, questions N01-20 from Log2.sav.


### Model

```
responseMean[personIndex, indicatorIndex] <- intercept[indicatorIndex] + factorLoading[indicatorIndex, 1] * factorScore[personIndex, 1] + ... + factorLoading[indicatorIndex, factorCount] * factorScore[personIndex, factorCount]
response[personIndex, indicatorIndex] ~ normal(responseMean[personIndex, indicatorIndex], errorVariance[indicatorIndex])
```

Priors:
 - factorScore ~ cauchy(0, 1)
 - factorLoading ~ cauchy(0, 1) (truncated to only allow non-negative numbers)
 - intercept ~ cauchy(0, 1)
 - errorVariance ~ cauchy(0, 5) (truncated to only allow non-negative numbers)

MCMC settings:
 - Chains: 1 (model is not fully identified; factors are interchangeable)
 - Burnin: 500
 - Samples: 4000
 - Thinning: 1

MCMC diagnostics:
 - [plot_fa_errorVariance_autocorrelation-crosscorrelation.pdf](../blob/master/output/fa/plot_fa_errorVariance_autocorrelation-crosscorrelation.pdf)
 - [plot_fa_errorVariance_density-caterpillar.pdf](../blob/master/output/fa/plot_fa_errorVariance_density-caterpillar.pdf)
 - [plot_fa_errorVariance_rhat-geweke.pdf](../blob/master/output/fa/plot_fa_errorVariance_rhat-geweke.pdf)
 - [plot_fa_errorVariance_traceplot-running-compare-partial.pdf](../blob/master/output/fa/plot_fa_errorVariance_traceplot-running-compare-partial.pdf)
 - [plot_fa_factorLoading_autocorrelation-crosscorrelation.pdf](../blob/master/output/fa/plot_fa_factorLoading_autocorrelation-crosscorrelation.pdf)
 - [plot_fa_factorLoading_density-caterpillar.pdf](../blob/master/output/fa/plot_fa_factorLoading_density-caterpillar.pdf)
 - [plot_fa_factorLoading_rhat-geweke.pdf](../blob/master/output/fa/plot_fa_factorLoading_rhat-geweke.pdf)
 - [plot_fa_factorLoading_traceplot-running-compare-partial.pdf](../blob/master/output/fa/plot_fa_factorLoading_traceplot-running-compare-partial.pdf)
 - [plot_fa_factorScore_autocorrelation-crosscorrelation.pdf](../blob/master/output/fa/plot_fa_factorScore_autocorrelation-crosscorrelation.pdf)
 - [plot_fa_factorScore_density-caterpillar.pdf](../blob/master/output/fa/plot_fa_factorScore_density-caterpillar.pdf)
 - [plot_fa_factorScore_rhat-geweke.pdf](../blob/master/output/fa/plot_fa_factorScore_rhat-geweke.pdf)
 - [plot_fa_factorScore_traceplot-running-compare-partial.pdf](../blob/master/output/fa/plot_fa_factorScore_traceplot-running-compare-partial.pdf)
 - [plot_fa_intercept_autocorrelation-crosscorrelation.pdf](../blob/master/output/fa/plot_fa_intercept_autocorrelation-crosscorrelation.pdf)
 - [plot_fa_intercept_density-caterpillar.pdf](../blob/master/output/fa/plot_fa_intercept_density-caterpillar.pdf)
 - [plot_fa_intercept_rhat-geweke.pdf](../blob/master/output/fa/plot_fa_intercept_rhat-geweke.pdf)
 - [plot_fa_intercept_traceplot-running-compare-partial.pdf](../blob/master/output/fa/plot_fa_intercept_traceplot-running-compare-partial.pdf)


### Results

Parameter values:
|` parameter          `|` mean (factor 1) `|` 95% hdi (factor 1)  `|` mean (factor 2) `|` 95% hdi (factor 2)  `|
|----------------------|------------------:|----------------------:|----------------------:|------------------:|
|` factorLoading[1,]  `|` 0.396           `|` 0.329 - 0.463       `|` 0.034           `|` 0.000 - 0.082       `|
|` factorLoading[2,]  `|` 0.393           `|` 0.313 - 0.470       `|` 0.046           `|` 0.000 - 0.108       `|
|` factorLoading[3,]  `|` 0.598           `|` 0.528 - 0.672       `|` 0.308           `|` 0.223 - 0.393       `|
|` factorLoading[4,]  `|` 0.244           `|` 0.176 - 0.314       `|` 0.523           `|` 0.461 - 0.598       `|
|` factorLoading[5,]  `|` 0.468           `|` 0.410 - 0.529       `|` 0.061           `|` 0.002 - 0.119       `|
|` factorLoading[6,]  `|` 0.638           `|` 0.572 - 0.709       `|` 0.277           `|` 0.197 - 0.360       `|
|` factorLoading[7,]  `|` 0.414           `|` 0.345 - 0.479       `|` 0.071           `|` 0.000 - 0.135       `|
|` factorLoading[8,]  `|` 0.020           `|` 0.000 - 0.054       `|` 0.369           `|` 0.293 - 0.440       `|
|` factorLoading[9,]  `|` 0.470           `|` 0.402 - 0.533       `|` 0.221           `|` 0.147 - 0.293       `|
|` factorLoading[10,] `|` 0.439           `|` 0.375 - 0.509       `|` 0.035           `|` 0.000 - 0.084       `|
|` factorLoading[11,] `|` 0.457           `|` 0.383 - 0.529       `|` 0.082           `|` 0.002 - 0.154       `|
|` factorLoading[12,] `|` 0.032           `|` 0.000 - 0.079       `|` 0.470           `|` 0.400 - 0.535       `|
|` factorLoading[13,] `|` 0.388           `|` 0.323 - 0.454       `|` 0.082           `|` 0.009 - 0.149       `|
|` factorLoading[14,] `|` 0.581           `|` 0.508 - 0.646       `|` 0.282           `|` 0.205 - 0.365       `|
|` factorLoading[15,] `|` 0.373           `|` 0.307 - 0.441       `|` 0.098           `|` 0.020 - 0.168       `|
|` factorLoading[16,] `|` 0.135           `|` 0.069 - 0.210       `|` 0.558           `|` 0.490 - 0.622       `|
|` factorLoading[17,] `|` 0.553           `|` 0.488 - 0.617       `|` 0.151           `|` 0.071 - 0.224       `|
|` factorLoading[18,] `|` 0.574           `|` 0.516 - 0.634       `|` 0.240           `|` 0.164 - 0.310       `|
|` factorLoading[19,] `|` 0.482           `|` 0.415 - 0.551       `|` 0.217           `|` 0.138 - 0.293       `|
|` factorLoading[20,] `|` 0.467           `|` 0.398 - 0.527       `|` 0.084           `|` 0.008 - 0.151       `|


### Comparison with classical factor analysis

#### Rotated Factor Matrix

|` Item `|` Factor 1 `|` Factor 2 `|
|--------|-----------:|-----------:|
|` 01   `|`  0,478   `|` -0,005   `|
|` 02   `|`  0,400   `|`  0,005   `|
|` 03   `|`  0,615   `|`  0,286   `|
|` 04   `|`  0,306   `|`  0,623   `|
|` 05   `|`  0,578   `|`  0,044   `|
|` 06   `|`  0,681   `|`  0,262   `|
|` 07   `|`  0,489   `|`  0,058   `|
|` 08   `|` -0,016   `|`  0,446   `|
|` 09   `|`  0,560   `|`  0,235   `|
|` 10   `|`  0,520   `|` -0,006   `|
|` 11   `|`  0,480   `|`  0,060   `|
|` 12   `|`  0,029   `|`  0,582   `|
|` 13   `|`  0,463   `|`  0,073   `|
|` 14   `|`  0,644   `|`  0,282   `|
|` 15   `|`  0,433   `|`  0,094   `|
|` 16   `|`  0,183   `|`  0,692   `|
|` 17   `|`  0,633   `|`  0,143   `|
|` 18   `|`  0,702   `|`  0,262   `|
|` 19   `|`  0,553   `|`  0,224   `|
|` 20   `|`  0,564   `|`  0,076   `|

#### Comparison

|` Item `|` Factor 1 `|` Factor 2 `|` Factor 1 (bayes) `|` Factor 2 (bayes) `|
|--------|-----------:|-----------:|-------------------:|-------------------:|
|` 01   `|`  0,478   `|` -0,005   `|`  0.396           `|` 0.034            `|
|` 02   `|`  0,400   `|`  0,005   `|`  0.393           `|` 0.046            `|
|` 03   `|`  0,615   `|`  0,286   `|`  0.598           `|` 0.308            `|
|` 04   `|`  0,306   `|`  0,623   `|`  0.244           `|` 0.523            `|
|` 05   `|`  0,578   `|`  0,044   `|`  0.468           `|` 0.061            `|
|` 06   `|`  0,681   `|`  0,262   `|`  0.638           `|` 0.277            `|
|` 07   `|`  0,489   `|`  0,058   `|`  0.414           `|` 0.071            `|
|` 08   `|` -0,016   `|`  0,446   `|` -0.020           `|` 0.369            `|
|` 09   `|`  0,560   `|`  0,235   `|`  0.470           `|` 0.221            `|
|` 10   `|`  0,520   `|` -0,006   `|`  0.439           `|` 0.035            `|
|` 11   `|`  0,480   `|`  0,060   `|`  0.457           `|` 0.082            `|
|` 12   `|`  0,029   `|`  0,582   `|`  0.032           `|` 0.470            `|
|` 13   `|`  0,463   `|`  0,073   `|`  0.388           `|` 0.082            `|
|` 14   `|`  0,644   `|`  0,282   `|`  0.581           `|` 0.282            `|
|` 15   `|`  0,433   `|`  0,094   `|`  0.373           `|` 0.098            `|
|` 16   `|`  0,183   `|`  0,692   `|`  0.135           `|` 0.558            `|
|` 17   `|`  0,633   `|`  0,143   `|`  0.553           `|` 0.151            `|
|` 18   `|`  0,702   `|`  0,262   `|`  0.574           `|` 0.240            `|
|` 19   `|`  0,553   `|`  0,224   `|`  0.482           `|` 0.217            `|
|` 20   `|`  0,564   `|`  0,076   `|`  0.467           `|` 0.084            `|
