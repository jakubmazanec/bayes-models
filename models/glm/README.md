GLM
===

## MOT

 - [mot.R](./mot.R)
 - [mot.stan](./mot.stan)


### Data

From [https://is.muni.cz/auth/th/254834/fss_m/](https://is.muni.cz/auth/th/254834/fss_m/)

2553 trials; subjects (298 people) tracked subset of moving objects in each trial

Variables:
 - number of tracked targets (trialCount)
 - saliency ratio targets / background (saliencyRatio)
 - canvas size (canvasSize)
 - result (success or failure to track all targets) (trial)


### Model

Parameters:
 - subject-specific intercept (alphaSubject)
 - effect of number of targets (betaNTargets)
 - effect of saliency ratio (betaSaliencyRatio)
 - interaction of the previous two (betaNTargetsAndSaliencyRatio)
 - effect of canvas size (betaCanvasSize)

```
trial ~ bernoulli_logit(alphaSubject + betaNTargets * nTargets + betaSaliencyRatio * saliencyRatio + betaCanvasSize * canvasSize + betaNTargetsAndSaliencyRatio * nTargetsAndSaliencyRatio)
```

Priors:
 - alphaSubject ~ normal(0, 10)
 - betaNTargets ~ normal(0, 10)
 - betaSaliencyRatio ~ normal(0, 10)
 - betaCanvasSize ~ normal(0, 10)
 - betaNTargetsAndSaliencyRatio ~ normal(0, 10)

MCMC settings:
 - Chains: 4
 - Warmup: 1000
 - Iterations total: 5000
 - Thinning: 2

MCMC diagnostics:
 - [alphaSubject.pdf](../../output/glm/ggmcmc-plot_glm-mot_alphaSubject.pdf)
 - [betaCanvasSize.pdf](../../output/glm/ggmcmc-plot_glm-mot_betaCanvasSize.pdf)
 - [betaNTargets.pdf](../../output/glm/ggmcmc-plot_glm-mot_betaNTargets.pdf)
 - [betaNTargetsAndSaliencyRatio.pdf](../../output/glm/ggmcmc-plot_glm-mot_betaNTargetsAndSaliencyRatio.pdf)
 - [betaSaliencyRatio.pdf](../../output/glm/ggmcmc-plot_glm-mot_betaSaliencyRatio.pdf)


### Results

Parameter values:

|` parameter                    `|` mean   `|` 95 % hdi    `|` 95 % hdi    `|` exp      `|` 95 % hdi    `|` 95 % hdi    `|
|--------------------------------|---------:|--------------:|--------------:|-----------:|--------------:|--------------:|
|` betaNTargets                 `|` -2.624 `|` -2.980      `|` -2.234      `|`    0.073 `|`    0.051    `|`     0.107   `|
|` betaSaliencyRatio            `|`  0.184 `|` -0.025      `|`  0.400      `|`    1.203 `|`    0.975    `|`     1.492   `|
|` betaCanvasSize               `|`  8.838 `|`  7.226      `|` 10.689      `|` 6893.826 `|` 1375.146    `|` 43855.436   `|
|` betaNTargetsAndSaliencyRatio `|` -0.008 `|` -0.062      `|`  0.044      `|`    0.992 `|`    0.940    `|`     1.045   `|

Parameters values summary:

|` parameter    `|` mean  `|` sd    `|
|----------------|---------|---------|
|` alphaSubject `|` 1.010 `|` 3.275 `|


### Comparison with classical binomial logit mixed-model

Parameter values:

|` parameter                     `|` coefficient `|` exp     `|` 95 % confidence interval `|` 95 % confidence interval `|
|---------------------------------|--------------:|----------:|---------------------------:|---------------------------:|
|` intercept                     `|`  6.445      `|` 629.568 `|` 308.551                  `|` 1284.572                 `|
|` nTargets                      `|` -1.913      `|`   0.148 `|`   0.126                  `|`    0.173                 `|
|` saliencyRatio                 `|` -0.117      `|`   0.890 `|`   0.849                  `|`    0.932                 `|
|` canvasSize                    `|`  0.546      `|`   1.727 `|`   1.133                  `|`    2.632                 `|
|` nTargets * saliencyRation     `|`  0.054      `|`   1.055 `|`   1.040                  `|`    1.071                 `|
