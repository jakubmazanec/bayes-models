IRT
===

## 1PL

 - [1pl.R](../blob/master/models/irt/1pl.R)
 - [1pl.stan](../blob/master/models/ir/1pl.stan)


### Data

Simulated using 1PL IRT model:
- [irt-1pl-1000(1)x20.R](../blob/master/data/irt-1pl-1000(1)x20.R)


### Model

```
response ~ bernoulli_logit(ability - difficulty)
```

Priors:
 - ability ~ normal(0, 1)
 - difficulty ~ normal(0, difficultyVariance)

Hyperpriors:
 - difficultyVariance ~ cauchy(0, 5) (truncated to only allow non-negative numbers)

MCMC settings:
 - Chains: 4
 - Burnin: 500
 - Samples: 1000
 - Thinning: 1

MCMC diagnostics:
 - [plot_1pl_abilit_rhat-geweke.pdf](../blob/master/output/irt/plot_1pl_abilit_rhat-geweke.pdf)
 - [plot_1pl_abilit_autocorrelation-crosscorrelation.pdf](../blob/master/output/irt/plot_1pl_abilit_autocorrelation-crosscorrelation.pdf)
 - [plot_1pl_abilit_traceplot-running-compare-partial.pdf](../blob/master/output/irt/plot_1pl_abilit_traceplot-running-compare-partial.pdf)
 - [plot_1pl_abilit_density-caterpillar.pdf](../blob/master/output/irt/plot_1pl_abilit_density-caterpillar.pdf)
 - [plot_1pl_difficult_rhat-geweke.pdf](../blob/master/output/irt/plot_1pl_difficult_rhat-geweke.pdf)
 - [plot_1pl_difficult_autocorrelation-crosscorrelation.pdf](../blob/master/output/irt/plot_1pl_difficult_autocorrelation-crosscorrelation.pdf)
 - [plot_1pl_difficult_traceplot-running-compare-partial.pdf](../blob/master/output/irt/plot_1pl_difficult_traceplot-running-compare-partial.pdf)
 - [plot_1pl_difficult_density-caterpillar.pdf](../blob/master/output/irt/plot_1pl_difficult_density-caterpillar.pdf)


### Results

Difficulty parameter values:
|` parameter      `|` value   `|` true value `|` difference `|
|------------------|----------:|-------------:|-------------:|
|` difficulty[1]  `|` -0.818  `|` -0.863     `|`  0.044     `|
|` difficulty[2]  `|` -0.036  `|` -0.025     `|` -0.011     `|
|` difficulty[3]  `|` -0.763  `|` -0.740     `|` -0.022     `|
|` difficulty[4]  `|` -1.644  `|` -1.524     `|` -0.120     `|
|` difficulty[5]  `|`  1.357  `|`  1.365     `|` -0.008     `|
|` difficulty[6]  `|` -1.601  `|` -1.516     `|` -0.085     `|
|` difficulty[7]  `|` -0.060  `|` -0.093     `|`  0.032     `|
|` difficulty[8]  `|`  2.431  `|`  2.396     `|`  0.035     `|
|` difficulty[9]  `|` -0.901  `|` -0.749     `|` -0.152     `|
|` difficulty[10] `|` -1.499  `|` -1.375     `|` -0.123     `|
|` difficulty[11] `|`  0.342  `|`  0.409     `|` -0.067     `|
|` difficulty[12] `|` -0.350  `|` -0.290     `|` -0.059     `|
|` difficulty[13] `|`  0.137  `|`  0.127     `|`  0.010     `|
|` difficulty[14] `|`  0.506  `|`  0.444     `|`  0.062     `|
|` difficulty[15] `|` -0.667  `|` -0.727     `|`  0.059     `|
|` difficulty[16] `|` -2.680  `|` -2.590     `|` -0.090     `|
|` difficulty[17] `|`  0.811  `|`  0.848     `|` -0.037     `|
|` difficulty[18] `|`  0.353  `|`  0.440     `|` -0.087     `|
|` difficulty[19] `|`  0.222  `|`  0.228     `|` -0.006     `|
|` difficulty[20] `|` -0.488  `|` -0.477     `|` -0.011     `|

Ability parameter values (only the first twenty):
|` parameter     `|` value   `|` true value `|` difference `|
|-----------------|----------:|-------------:|-------------:|
|` ability[1]    `|`  0.410  `|`  0.720     `|` -0.309     `|
|` ability[2]    `|` -0.013  `|`  0.217     `|` -0.230     `|
|` ability[3]    `|`  0.394  `|`  0.182     `|`  0.212     `|
|` ability[4]    `|` -0.840  `|` -1.341     `|`  0.500     `|
|` ability[5]    `|` -0.223  `|` -0.167     `|` -0.056     `|
|` ability[6]    `|` -0.618  `|` -0.921     `|`  0.303     `|
|` ability[7]    `|` -0.436  `|`  0.126     `|` -0.562     `|
|` ability[8]    `|` -0.837  `|` -0.177     `|` -0.660     `|
|` ability[9]    `|` -1.500  `|` -2.139     `|`  0.639     `|
|` ability[10]   `|` -0.009  `|` -0.313     `|`  0.304     `|
|` ability[11]   `|` -1.740  `|` -2.559     `|`  0.819     `|
|` ability[12]   `|`  0.400  `|`  0.113     `|`  0.287     `|
|` ability[13]   `|`  1.965  `|`  1.218     `|`  0.747     `|
|` ability[14]   `|` -0.019  `|` -0.258     `|`  0.239     `|
|` ability[15]   `|` -0.223  `|` -0.239     `|`  0.016     `|
|` ability[16]   `|`  0.191  `|` -0.109     `|`  0.300     `|
|` ability[17]   `|` -0.627  `|` -1.046     `|`  0.418     `|
|` ability[18]   `|`  0.189  `|`  0.783     `|` -0.594     `|
|` ability[19]   `|` -0.016  `|` -0.409     `|`  0.392     `|
|` ability[20]   `|` -0.837  `|` -1.530     `|`  0.693     `|

Mean of absolute values of differences between estimated and true value:
 - difficulties: 0.056
 - abilities: 0.363



## 2PL

 - [2pl.R](../blob/master/models/irt/2pl.R)
 - [2pl.stan](../blob/master/models/ir/2pl.stan)


### Data

Simulated using 2PL MIRT model:
- [irt-2pl-1000(10)x20.R](../blob/master/data/irt-2pl-1000(10)x20.R)


### Model

```
response ~ bernoulli_logit(discrimination * (ability - difficulty))
```

Priors:
 - ability ~ normal(0, 1)
 - difficulty ~ normal(0, difficultyVariance)
 - discrimination ~ lognormal(0, discriminationVariance)

Hyperpriors:
 - difficultyVariance ~ cauchy(0, 5) (truncated to only allow non-negative numbers)
 - discriminationVariance ~ cauchy(0, 5) (truncated to only allow non-negative numbers)

MCMC settings:
 - Chains: 4
 - Burnin: 200
 - Samples: 1000
 - Thinning: 2

MCMC diagnostics:
 - [plot_2pl_discrimination_rhat-geweke.pdf](../blob/master/output/irt/plot_2pl_discrimination_rhat-geweke.pdf)
 - [plot_2pl_discrimination_autocorrelation-crosscorrelation.pdf](../blob/master/output/irt/plot_2pl_discrimination_autocorrelation-crosscorrelation.pdf)
 - [plot_2pl_discrimination_traceplot-running-compare-partial.pdf](../blob/master/output/irt/plot_2pl_discrimination_traceplot-running-compare-partial.pdf)
 - [plot_2pl_discrimination_density-caterpillar.pdf](../blob/master/output/irt/plot_2pl_discrimination_density-caterpillar.pdf)
 - [plot_2pl_abilit_rhat-geweke.pdf](../blob/master/output/irt/plot_2pl_abilit_rhat-geweke.pdf)
 - [plot_2pl_abilit_autocorrelation-crosscorrelation.pdf](../blob/master/output/irt/plot_2pl_abilit_autocorrelation-crosscorrelation.pdf)
 - [plot_2pl_abilit_traceplot-running-compare-partial.pdf](../blob/master/output/irt/plot_2pl_abilit_traceplot-running-compare-partial.pdf)
 - [plot_2pl_abilit_density-caterpillar.pdf](../blob/master/output/irt/plot_2pl_abilit_density-caterpillar.pdf)
 - [plot_2pl_difficult_rhat-geweke.pdf](../blob/master/output/irt/plot_2pl_difficult_rhat-geweke.pdf)
 - [plot_2pl_difficult_autocorrelation-crosscorrelation.pdf](../blob/master/output/irt/plot_2pl_difficult_autocorrelation-crosscorrelation.pdf)
 - [plot_2pl_difficult_traceplot-running-compare-partial.pdf](../blob/master/output/irt/plot_2pl_difficult_traceplot-running-compare-partial.pdf)
 - [plot_2pl_difficult_density-caterpillar.pdf](../blob/master/output/irt/plot_2pl_difficult_density-caterpillar.pdf)


### Results

Difficulty parameter values:
|` parameter      `|` value   `|` true value `|` difference `|
|------------------|----------:|-------------:|-------------:|
|` difficulty[1]  `|` -0.907  `|` -0.762     `|` -0.144     `|
|` difficulty[2]  `|` -0.061  `|` -0.070     `|`  0.009     `|
|` difficulty[3]  `|`  0.088  `|`  0.084     `|`  0.003     `|
|` difficulty[4]  `|` -0.781  `|` -1.490     `|`  0.708     `|
|` difficulty[5]  `|` -3.316  `|` -0.577     `|` -2.738     `|
|` difficulty[6]  `|`  2.749  `|`  0.676     `|`  2.072     `|
|` difficulty[7]  `|` -0.406  `|` -0.632     `|`  0.226     `|
|` difficulty[8]  `|` -3.346  `|` -1.820     `|` -1.526     `|
|` difficulty[9]  `|`  2.022  `|`  1.057     `|`  0.964     `|
|` difficulty[10] `|` -0.026  `|` -0.008     `|` -0.018     `|
|` difficulty[11] `|` -0.010  `|` -0.017     `|`  0.006     `|
|` difficulty[12] `|`  4.546  `|`  1.260     `|`  3.286     `|
|` difficulty[13] `|` -0.719  `|` -0.571     `|` -0.148     `|
|` difficulty[14] `|`  0.127  `|`  0.082     `|`  0.045     `|
|` difficulty[15] `|`  0.199  `|`  0.495     `|` -0.296     `|
|` difficulty[16] `|`  0.153  `|`  0.200     `|` -0.046     `|
|` difficulty[17] `|`  4.240  `|`  1.162     `|`  3.077     `|
|` difficulty[18] `|` -0.041  `|`  0.127     `|` -0.168     `|
|` difficulty[19] `|` -2.530  `|` -2.407     `|` -0.122     `|
|` difficulty[20] `|` -0.451  `|` -0.754     `|`  0.303     `|

Discrimination parameter values:
|` parameter          `|` value   `|` true value `|` difference `|
|----------------------|----------:|-------------:|-------------:|
|` discrimination[1]  `|` 0.749   `|` 0.686      `|`  0.062     `|
|` discrimination[2]  `|` 0.815   `|` 0.789      `|`  0.026     `|
|` discrimination[3]  `|` 1.292   `|` 1.260      `|`  0.031     `|
|` discrimination[4]  `|` 1.937   `|` 1.803      `|`  0.133     `|
|` discrimination[5]  `|` 0.178   `|` 0.100      `|`  0.078     `|
|` discrimination[6]  `|` 0.264   `|` 0.127      `|`  0.136     `|
|` discrimination[7]  `|` 1.597   `|` 1.284      `|`  0.312     `|
|` discrimination[8]  `|` 0.574   `|` 0.276      `|`  0.297     `|
|` discrimination[9]  `|` 0.540   `|` 0.378      `|`  0.161     `|
|` discrimination[10] `|` 1.112   `|` 1.184      `|` -0.072     `|
|` discrimination[11] `|` 1.403   `|` 1.288      `|`  0.115     `|
|` discrimination[12] `|` 0.284   `|` 0.100      `|`  0.184     `|
|` discrimination[13] `|` 0.680   `|` 0.696      `|` -0.015     `|
|` discrimination[14] `|` 2.345   `|` 2.156      `|`  0.189     `|
|` discrimination[15] `|` 1.994   `|` 1.784      `|`  0.210     `|
|` discrimination[16] `|` 2.506   `|` 2.401      `|`  0.104     `|
|` discrimination[17] `|` 0.280   `|` 0.100      `|`  0.180     `|
|` discrimination[18] `|` 0.552   `|` 0.460      `|`  0.091     `|
|` discrimination[19] `|` 0.989   `|` 0.900      `|`  0.088     `|
|` discrimination[20] `|` 1.634   `|` 1.600      `|`  0.033     `|

Ability parameter values (only the first twenty):
|` parameter     `|` value   `|` true value `|` difference `|
|-----------------|----------:|-------------:|-------------:|
|` ability[1]    `|` -0.172  `|` -0.072     `|` -0.099     `|
|` ability[2]    `|` -0.558  `|` -0.250     `|` -0.307     `|
|` ability[3]    `|` -0.482  `|` -1.927     `|`  1.444     `|
|` ability[4]    `|`  1.593  `|`  1.767     `|` -0.173     `|
|` ability[5]    `|`  0.358  `|`  0.433     `|` -0.075     `|
|` ability[6]    `|`  0.611  `|`  0.461     `|`  0.150     `|
|` ability[7]    `|` -1.043  `|` -0.908     `|` -0.135     `|
|` ability[8]    `|`  0.044  `|` -0.484     `|`  0.529     `|
|` ability[9]    `|` -0.977  `|` -1.540     `|`  0.562     `|
|` ability[10]   `|`  0.851  `|`  1.356     `|` -0.505     `|
|` ability[11]   `|` -0.702  `|` -0.758     `|`  0.056     `|
|` ability[12]   `|`  1.601  `|`  2.242     `|` -0.641     `|
|` ability[13]   `|` -1.616  `|` -1.376     `|` -0.239     `|
|` ability[14]   `|`  0.660  `|`  1.349     `|` -0.689     `|
|` ability[15]   `|`  0.130  `|` -0.033     `|`  0.163     `|
|` ability[16]   `|`  0.903  `|`  0.833     `|`  0.069     `|
|` ability[17]   `|`  1.795  `|`  0.991     `|`  0.803     `|
|` ability[18]   `|`  0.314  `|`  0.005     `|`  0.308     `|
|` ability[19]   `|` -1.085  `|` -1.373     `|`  0.288     `|
|` ability[20]   `|` -0.620  `|` -0.193     `|` -0.426     `|

Mean of absolute values of differences between estimated and true value:
 - difficulties: 0.796

Mean of absolute values of differences between estimated and true value with greatest effect:
 - discriminations: 0.126
 - abilities: 0.389



## 2PN

 - [2pn.R](../blob/master/models/irt/2pn.R)
 - [2pn.stan](../blob/master/models/ir/2pn.stan)


### Data

Simulated using 2PL MIRT model:
- [irt-2pl-1000(10)x20.R](../blob/master/data/irt-2pl-1000(10)x20.R)


### Model

```
response ~ bernoulli(phi(discrimination * (ability - difficulty)))
```

Priors:
 - ability ~ normal(0, 1)
 - difficulty ~ normal(0, difficultyVariance)
 - discrimination ~ lognormal(0, discriminationVariance)

Hyperpriors:
 - difficultyVariance ~ cauchy(0, 5) (truncated to only allow non-negative numbers)
 - discriminationVariance ~ cauchy(0, 5) (truncated to only allow non-negative numbers)

MCMC settings:
 - Chains: 4
 - Burnin: 200
 - Samples: 1000
 - Thinning: 2

MCMC diagnostics:
 - [plot_2pn_discrimination_rhat-geweke.pdf](../blob/master/output/irt/plot_2pn_discrimination_rhat-geweke.pdf)
 - [plot_2pn_discrimination_autocorrelation-crosscorrelation.pdf](../blob/master/output/irt/plot_2pn_discrimination_autocorrelation-crosscorrelation.pdf)
 - [plot_2pn_discrimination_traceplot-running-compare-partial.pdf](../blob/master/output/irt/plot_2pn_discrimination_traceplot-running-compare-partial.pdf)
 - [plot_2pn_discrimination_density-caterpillar.pdf](../blob/master/output/irt/plot_2pn_discrimination_density-caterpillar.pdf)
 - [plot_2pn_abilit_rhat-geweke.pdf](../blob/master/output/irt/plot_2pn_abilit_rhat-geweke.pdf)
 - [plot_2pn_abilit_autocorrelation-crosscorrelation.pdf](../blob/master/output/irt/plot_2pn_abilit_autocorrelation-crosscorrelation.pdf)
 - [plot_2pn_abilit_traceplot-running-compare-partial.pdf](../blob/master/output/irt/plot_2pn_abilit_traceplot-running-compare-partial.pdf)
 - [plot_2pn_abilit_density-caterpillar.pdf](../blob/master/output/irt/plot_2pn_abilit_density-caterpillar.pdf)
 - [plot_2pn_difficult_rhat-geweke.pdf](../blob/master/output/irt/plot_2pn_difficult_rhat-geweke.pdf)
 - [plot_2pn_difficult_autocorrelation-crosscorrelation.pdf](../blob/master/output/irt/plot_2pn_difficult_autocorrelation-crosscorrelation.pdf)
 - [plot_2pn_difficult_traceplot-running-compare-partial.pdf](../blob/master/output/irt/plot_2pn_difficult_traceplot-running-compare-partial.pdf)
 - [plot_2pn_difficult_density-caterpillar.pdf](../blob/master/output/irt/plot_2pn_difficult_density-caterpillar.pdf)

### Results


Difficulty parameter values:
|` parameter      `|` value   `|` true value `|` difference `|
|------------------|----------:|-------------:|-------------:|
|` difficulty[1]  `|` -0.910  `|` -0.762     `|` -0.147     `|
|` difficulty[2]  `|` -0.062  `|` -0.070     `|`  0.007     `|
|` difficulty[3]  `|`  0.089  `|`  0.084     `|`  0.004     `|
|` difficulty[4]  `|` -0.784  `|` -1.490     `|`  0.705     `|
|` difficulty[5]  `|` -3.551  `|` -0.577     `|` -2.973     `|
|` difficulty[6]  `|`  2.883  `|`  0.676     `|`  2.206     `|
|` difficulty[7]  `|` -0.404  `|` -0.632     `|`  0.227     `|
|` difficulty[8]  `|` -3.554  `|` -1.820     `|` -1.734     `|
|` difficulty[9]  `|`  2.091  `|`  1.057     `|`  1.034     `|
|` difficulty[10] `|` -0.027  `|` -0.008     `|` -0.019     `|
|` difficulty[11] `|` -0.008  `|` -0.017     `|`  0.008     `|
|` difficulty[12] `|`  4.874  `|`  1.260     `|`  3.614     `|
|` difficulty[13] `|` -0.722  `|` -0.571     `|` -0.151     `|
|` difficulty[14] `|`  0.129  `|`  0.082     `|`  0.046     `|
|` difficulty[15] `|`  0.199  `|`  0.495     `|` -0.296     `|
|` difficulty[16] `|`  0.154  `|`  0.200     `|` -0.046     `|
|` difficulty[17] `|`  4.440  `|`  1.162     `|`  3.277     `|
|` difficulty[18] `|` -0.031  `|`  0.127     `|` -0.158     `|
|` difficulty[19] `|` -2.698  `|` -2.407     `|` -0.290     `|
|` difficulty[20] `|` -0.448  `|` -0.754     `|`  0.306     `|

Discrimination parameter values:
|` parameter          `|` value   `|` true value `|` difference `|
|----------------------|----------:|-------------:|-------------:|
|` discrimination[1]  `|` 0.457   `|` 0.686      `|` -0.229     `|
|` discrimination[2]  `|` 0.498   `|` 0.789      `|` -0.291     `|
|` discrimination[3]  `|` 0.781   `|` 1.260      `|` -0.479     `|
|` discrimination[4]  `|` 1.104   `|` 1.803      `|` -0.698     `|
|` discrimination[5]  `|` 0.104   `|` 0.100      `|`  0.004     `|
|` discrimination[6]  `|` 0.156   `|` 0.127      `|`  0.028     `|
|` discrimination[7]  `|` 0.942   `|` 1.284      `|` -0.342     `|
|` discrimination[8]  `|` 0.317   `|` 0.276      `|`  0.040     `|
|` discrimination[9]  `|` 0.316   `|` 0.378      `|` -0.062     `|
|` discrimination[10] `|` 0.677   `|` 1.184      `|` -0.507     `|
|` discrimination[11] `|` 0.840   `|` 1.288      `|` -0.447     `|
|` discrimination[12] `|` 0.160   `|` 0.100      `|`  0.060     `|
|` discrimination[13] `|` 0.416   `|` 0.696      `|` -0.280     `|
|` discrimination[14] `|` 1.371   `|` 2.156      `|` -0.784     `|
|` discrimination[15] `|` 1.167   `|` 1.784      `|` -0.616     `|
|` discrimination[16] `|` 1.449   `|` 2.401      `|` -0.952     `|
|` discrimination[17] `|` 0.163   `|` 0.100      `|`  0.063     `|
|` discrimination[18] `|` 0.342   `|` 0.460      `|` -0.117     `|
|` discrimination[19] `|` 0.525   `|` 0.900      `|` -0.375     `|
|` discrimination[20] `|` 0.963   `|` 1.600      `|` -0.637     `|

Ability parameter values (only the first twenty):
|` parameter     `|` value   `|` true value `|` difference `|
|-----------------|----------:|-------------:|-------------:|
|` ability[1]    `|` -0.175  `|` -0.072     `|` -0.103     `|
|` ability[2]    `|` -0.551  `|` -0.250     `|` -0.300     `|
|` ability[3]    `|` -0.494  `|` -1.927     `|`  1.433     `|
|` ability[4]    `|`  1.652  `|`  1.767     `|` -0.114     `|
|` ability[5]    `|`  0.330  `|`  0.433     `|` -0.103     `|
|` ability[6]    `|`  0.606  `|`  0.461     `|`  0.145     `|
|` ability[7]    `|` -1.056  `|` -0.908     `|` -0.148     `|
|` ability[8]    `|`  0.052  `|` -0.484     `|`  0.537     `|
|` ability[9]    `|` -0.968  `|` -1.540     `|`  0.571     `|
|` ability[10]   `|`  0.809  `|`  1.356     `|` -0.546     `|
|` ability[11]   `|` -0.721  `|` -0.758     `|`  0.037     `|
|` ability[12]   `|`  1.611  `|`  2.242     `|` -0.631     `|
|` ability[13]   `|` -1.617  `|` -1.376     `|` -0.241     `|
|` ability[14]   `|`  0.647  `|`  1.349     `|` -0.702     `|
|` ability[15]   `|`  0.123  `|` -0.033     `|`  0.156     `|
|` ability[16]   `|`  0.882  `|`  0.833     `|`  0.048     `|
|` ability[17]   `|`  1.808  `|`  0.991     `|`  0.816     `|
|` ability[18]   `|`  0.320  `|`  0.005     `|`  0.314     `|
|` ability[19]   `|` -1.061  `|` -1.373     `|`  0.312     `|
|` ability[20]   `|` -0.617  `|` -0.193     `|` -0.424     `|

Mean of absolute values of differences between estimated and true value:
 - difficulties: 0.863

Mean of absolute values of differences between estimated and true value with greatest effect:
 - discriminations: 0.351
 - abilities: 0.389

### Comparison with 2PL model

Difficulty parameter values:
|` parameter      `|` 2PN     `|` 2PL        `|
|------------------|----------:|-------------:|
|` difficulty[1]  `|` -0.910  `|` -0.907     `|
|` difficulty[2]  `|` -0.062  `|` -0.061     `|
|` difficulty[3]  `|`  0.089  `|`  0.088     `|
|` difficulty[4]  `|` -0.784  `|` -0.781     `|
|` difficulty[5]  `|` -3.551  `|` -3.316     `|
|` difficulty[6]  `|`  2.883  `|`  2.749     `|
|` difficulty[7]  `|` -0.404  `|` -0.406     `|
|` difficulty[8]  `|` -3.554  `|` -3.346     `|
|` difficulty[9]  `|`  2.091  `|`  2.022     `|
|` difficulty[10] `|` -0.027  `|` -0.026     `|
|` difficulty[11] `|` -0.008  `|` -0.010     `|
|` difficulty[12] `|`  4.874  `|`  4.546     `|
|` difficulty[13] `|` -0.722  `|` -0.719     `|
|` difficulty[14] `|`  0.129  `|`  0.127     `|
|` difficulty[15] `|`  0.199  `|`  0.199     `|
|` difficulty[16] `|`  0.154  `|`  0.153     `|
|` difficulty[17] `|`  4.440  `|`  4.240     `|
|` difficulty[18] `|` -0.031  `|` -0.041     `|
|` difficulty[19] `|` -2.698  `|` -2.530     `|
|` difficulty[20] `|` -0.448  `|` -0.451     `|

Discrimination parameter values:
|` parameter          `|` 2PN     `|` 2PL        `|
|----------------------|----------:|-------------:|
|` discrimination[1]  `|` 0.457   `|` 0.749      `|
|` discrimination[2]  `|` 0.498   `|` 0.815      `|
|` discrimination[3]  `|` 0.781   `|` 1.292      `|
|` discrimination[4]  `|` 1.104   `|` 1.937      `|
|` discrimination[5]  `|` 0.104   `|` 0.178      `|
|` discrimination[6]  `|` 0.156   `|` 0.264      `|
|` discrimination[7]  `|` 0.942   `|` 1.597      `|
|` discrimination[8]  `|` 0.317   `|` 0.574      `|
|` discrimination[9]  `|` 0.316   `|` 0.540      `|
|` discrimination[10] `|` 0.677   `|` 1.112      `|
|` discrimination[11] `|` 0.840   `|` 1.403      `|
|` discrimination[12] `|` 0.160   `|` 0.284      `|
|` discrimination[13] `|` 0.416   `|` 0.680      `|
|` discrimination[14] `|` 1.371   `|` 2.345      `|
|` discrimination[15] `|` 1.167   `|` 1.994      `|
|` discrimination[16] `|` 1.449   `|` 2.506      `|
|` discrimination[17] `|` 0.163   `|` 0.280      `|
|` discrimination[18] `|` 0.342   `|` 0.552      `|
|` discrimination[19] `|` 0.525   `|` 0.989      `|
|` discrimination[20] `|` 0.963   `|` 1.634      `|

Ability parameter values (only the first twenty):
|` parameter     `|` 2PN     `|` 2PL        `|
|-----------------|----------:|-------------:|
|` ability[1]    `|` -0.175  `|` -0.172     `|
|` ability[2]    `|` -0.551  `|` -0.558     `|
|` ability[3]    `|` -0.494  `|` -0.482     `|
|` ability[4]    `|`  1.652  `|`  1.593     `|
|` ability[5]    `|`  0.330  `|`  0.358     `|
|` ability[6]    `|`  0.606  `|`  0.611     `|
|` ability[7]    `|` -1.056  `|` -1.043     `|
|` ability[8]    `|`  0.052  `|`  0.044     `|
|` ability[9]    `|` -0.968  `|` -0.977     `|
|` ability[10]   `|`  0.809  `|`  0.851     `|
|` ability[11]   `|` -0.721  `|` -0.702     `|
|` ability[12]   `|`  1.611  `|`  1.601     `|
|` ability[13]   `|` -1.617  `|` -1.616     `|
|` ability[14]   `|`  0.647  `|`  0.660     `|
|` ability[15]   `|`  0.123  `|`  0.130     `|
|` ability[16]   `|`  0.882  `|`  0.903     `|
|` ability[17]   `|`  1.808  `|`  1.795     `|
|` ability[18]   `|`  0.320  `|`  0.314     `|
|` ability[19]   `|` -1.061  `|` -1.085     `|
|` ability[20]   `|` -0.617  `|` -0.620     `|
