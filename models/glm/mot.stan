data {
	int<lower = 1> trialCount;
	int<lower = 1> nSubjects;
	int<lower = 0, upper = nSubjects> subject[trialCount];
	int<lower = 0> nTargets[trialCount];
	real<lower = 0> saliencyRatio[trialCount];
	real<lower = 0> canvasSize[trialCount];
	int<lower = 0, upper = 1> trial[trialCount];
}

transformed data {
	vector[trialCount] nTargetsAndSaliencyRatio;
	
	for (trialIndex in 1:trialCount) {
		nTargetsAndSaliencyRatio[trialIndex] <- nTargets[trialIndex] * saliencyRatio[trialIndex];
	}
}

parameters {
	real alphaSubject[nSubjects];
	real betaNTargets;
	real betaSaliencyRatio;
	real betaCanvasSize;
	real betaNTargetsAndSaliencyRatio;
}

model {
	// priors
	alphaSubject ~ normal(0, 10);
	betaNTargets ~ normal(0, 10);
	betaSaliencyRatio ~ normal(0, 10);
	betaCanvasSize ~ normal(0, 10);
	betaNTargetsAndSaliencyRatio ~ normal(0, 10);
	
	// model calculations
	for(trialIndex in 1:trialCount) {
		trial[trialIndex] ~ bernoulli_logit(alphaSubject[subject[trialIndex]]
			+ betaNTargets * nTargets[trialIndex]
			+ betaSaliencyRatio * saliencyRatio[trialIndex]
			+ betaCanvasSize * canvasSize[trialIndex]
			+ betaNTargetsAndSaliencyRatio * nTargetsAndSaliencyRatio[trialIndex]);
	}
}

generated quantities {
	int<lower = 0, upper = 1> predictedTrial[trialCount];
	
	for(trialIndex in 1:trialCount) {
		predictedTrial[trialIndex] <- bernoulli_rng(inv_logit(alphaSubject[subject[trialIndex]]
			+ betaNTargets * nTargets[trialIndex]
			+ betaSaliencyRatio * saliencyRatio[trialIndex]
			+ betaCanvasSize * canvasSize[trialIndex]
			+ betaNTargetsAndSaliencyRatio * nTargetsAndSaliencyRatio[trialIndex]));
	}
}
