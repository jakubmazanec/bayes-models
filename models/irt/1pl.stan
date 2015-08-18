data {
	int<lower = 1> itemCount;
	int<lower = 1> personCount;
	int<lower = 1> responseCount;
	int<lower = 0, upper = 1> responses[responseCount];
	int<lower = 1> itemIds[responseCount];
	int<lower = 1> personIds[responseCount];
}

parameters {
	real difficulties[itemCount];
	real abilities[personCount];
	real<lower = 0> difficultyVariance;
}

model {
	// hyperpriors
	difficultyVariance ~ cauchy(0, 5);

	// priors
	abilities ~ normal(0, 1);
	difficulties ~ normal(0, difficultyVariance);
	
	for (responseIndex in 1:responseCount) {
	  responses[responseIndex] ~ bernoulli_logit(abilities[personIds[responseIndex]] - difficulties[itemIds[responseIndex]]);
	}
}
