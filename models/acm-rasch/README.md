ACM axioms test for the Rasch model
===================================

 - [acm-rash-perline-data.R](./acm-rash-perline-data.R)
 - [acm-rash-simulated-data-1.R](./acm-rash-simulated-data-1.R)
 - [acm-rash-simulated-data-2.R](./acm-rash-simulated-data-2.R)
 - [acm-rash-simulated-data-3.R](./acm-rash-simulated-data-3.R)

## Sources

Domingue, B. (2014). Evaluating the equal-interval hypothesis with test score scales. Psychometrika, 79(1), 1-19.
Karabatsos, G. (2001). The Rasch model, additive conjoint measurement, and new models of probabilistic measurement theory. Journal of applied measurement, 2(4), 389-423.
Kyngdon, A. (2011). Plausible measurement analogies to some psychometric models of test performance. British Journal of Mathematical and Statistical Psychology, 64(3), 478-497.

## Data

Simulated using (M)IRT models:
- [irt-1pl-1000(1)x20.R](../../data/irt-1pl-1000(1)x20.R)
- [irt-2pl-1000(10)x20.R](../../data/irt-2pl-1000(10)x20.R)
- [irt-2pl-1000(10)x20.R](../../data/irt-2pl-1000(10)x20.R)

And data from:
 - Perline, R., Wright, B. D., & Wainer, H. (1979). The Rasch model as additive conjoint measurement. Applied Psychological Measurement, 3(2), 237-255.


## Example using Perline data

Items a persons are arranged into a table based on their score of correct responses.

Correct responses:

|                                   |` 1 (Most difficult items) `|` 2  `|` 3  `|` 4  `|` 5  `|` 6  `|` 7  `|` 8  `|` 9  `|
|-----------------------------------|---------------------------:|-----:|-----:|-----:|-----:|-----:|-----:|-----:|-----:|
|` 1 (Persons with lowest ability) `|`  0                       `|`  0 `|`  0 `|`  0 `|`  0 `|`  0 `|`  4 `|`  0 `|` 11 `|
|` 2                               `|`  3                       `|`  2 `|`  2 `|`  9 `|`  3 `|` 11 `|` 24 `|` 10 `|` 30 `|
|` 3                               `|`  4                       `|`  9 `|`  5 `|` 24 `|` 11 `|` 20 `|` 37 `|` 32 `|` 41 `|
|` 4                               `|` 15                       `|` 20 `|` 10 `|` 34 `|` 44 `|` 43 `|` 54 `|` 57 `|` 59 `|
|` 5                               `|` 11                       `|` 27 `|` 25 `|` 42 `|` 60 `|` 56 `|` 56 `|` 69 `|` 64 `|
|` 6                               `|` 11                       `|` 24 `|` 55 `|` 50 `|` 82 `|` 78 `|` 66 `|` 83 `|` 67 `|
|` 7                               `|` 10                       `|` 28 `|` 51 `|` 49 `|` 60 `|` 56 `|` 54 `|` 58 `|` 54 `|
|` 8                               `|`  8                       `|` 40 `|` 47 `|` 46 `|` 47 `|` 47 `|` 47 `|` 47 `|` 47 `|
|` 9                               `|`  8                       `|`  8 `|`  8 `|`  8 `|`  8 `|`  8 `|`  8 `|`  8 `|`  8 `|
           
Total responses:

|                                   |` 1 (Most difficult items) `|` 2  `|` 3  `|` 4  `|` 5  `|` 6  `|` 7  `|` 8  `|` 9  `|
|-----------------------------------|---------------------------:|-----:|-----:|-----:|-----:|-----:|-----:|-----:|-----:|
|` 1 (Persons with lowest ability) `|` 15                       `|` 15 `|` 15 `|` 15 `|` 15 `|` 15 `|` 15 `|` 15 `|` 15 `|
|` 2                               `|` 47                       `|` 47 `|` 47 `|` 47 `|` 47 `|` 47 `|` 47 `|` 47 `|` 47 `|
|` 3                               `|` 61                       `|` 61 `|` 61 `|` 61 `|` 61 `|` 61 `|` 61 `|` 61 `|` 61 `|
|` 4                               `|` 84                       `|` 84 `|` 84 `|` 84 `|` 84 `|` 84 `|` 84 `|` 84 `|` 84 `|
|` 5                               `|` 82                       `|` 82 `|` 82 `|` 82 `|` 82 `|` 82 `|` 82 `|` 82 `|` 82 `|
|` 6                               `|` 86                       `|` 86 `|` 86 `|` 86 `|` 86 `|` 86 `|` 86 `|` 86 `|` 86 `|
|` 7                               `|` 60                       `|` 60 `|` 60 `|` 60 `|` 60 `|` 60 `|` 60 `|` 60 `|` 60 `|
|` 8                               `|` 47                       `|` 47 `|` 47 `|` 47 `|` 47 `|` 47 `|` 47 `|` 47 `|` 47 `|
|` 9                               `|`  8                       `|`  8 `|`  8 `|`  8 `|`  8 `|`  8 `|`  8 `|`  8 `|`  8 `|

Proportions of the correct responses:

|                                   |` 1 (Most difficult items) `|` 2     `|` 3     `|` 4     `|` 5     `|` 6     `|` 7     `|` 8     `|` 9     `|
|-----------------------------------|---------------------------:|--------:|--------:|--------:|--------:|--------:|--------:|--------:|--------:|
|` 1 (Persons with lowest ability) `|` 0.000                    `|` 0.000 `|` 0.000 `|` 0.000 `|` 0.000 `|` 0.000 `|` 0.266 `|` 0.000 `|` 0.733 `|
|` 2                               `|` 0.063                    `|` 0.042 `|` 0.042 `|` 0.191 `|` 0.063 `|` 0.234 `|` 0.510 `|` 0.212 `|` 0.638 `|
|` 3                               `|` 0.065                    `|` 0.147 `|` 0.081 `|` 0.393 `|` 0.180 `|` 0.327 `|` 0.606 `|` 0.524 `|` 0.672 `|
|` 4                               `|` 0.178                    `|` 0.238 `|` 0.119 `|` 0.404 `|` 0.523 `|` 0.511 `|` 0.642 `|` 0.678 `|` 0.702 `|
|` 5                               `|` 0.134                    `|` 0.329 `|` 0.304 `|` 0.512 `|` 0.731 `|` 0.682 `|` 0.682 `|` 0.841 `|` 0.780 `|
|` 6                               `|` 0.127                    `|` 0.279 `|` 0.639 `|` 0.581 `|` 0.953 `|` 0.906 `|` 0.767 `|` 0.965 `|` 0.779 `|
|` 7                               `|` 0.166                    `|` 0.466 `|` 0.850 `|` 0.816 `|` 1.000 `|` 0.933 `|` 0.900 `|` 0.966 `|` 0.900 `|
|` 8                               `|` 0.170                    `|` 0.851 `|` 1.000 `|` 0.978 `|` 1.000 `|` 1.000 `|` 1.000 `|` 1.000 `|` 1.000 `|
|` 9                               `|` 1.000                    `|` 1.000 `|` 1.000 `|` 1.000 `|` 1.000 `|` 1.000 `|` 1.000 `|` 1.000 `|` 1.000 `|

3x3 submatrices are selected from these tables for testing single cancellation (SC) and double cancellation (DC) axioms of conjoint measurement. These axioms impose specific inequalities between cells (i.e. proportions of correct responses) of 3x3 matrix.

|            |` Item 1    `|` Item 2    `|` Item 3    `|
|------------|-------------|-------------|-------------|
|` Person 1 `|` (P1, I1)  `|` (P1, I2)  `|` (P1, I3)  `|
|` Person 2 `|` (P2, I1)  `|` (P2, I2)  `|` (P2, I3)  `|
|` Person 3 `|` (P3, I1)  `|` (P3, I2)  `|` (P3, I3)  `|

It results from SC that following must be true: (Px, I1) < (Px, I2), (Px, I2) < (Px, I3), and (P1, Ix) < (P2, Ix), (P2, Ix) < (P3, Ix) (and therefore (P1, I1) < (P2, I1), (P2, I1) < (P3, I2), etc.).

It results from DC that following must be true: if (P2, I1) < (P1, I2) and (P3, I2) < (P2, I3), then (P3, I1) < (P1, I3), or if (P2, I1) > (P1, I2) and (P3, I2) > (P2, I3), then (P3, I1) > (P1, I3).

To obtain estimates of true proportions, bayesian methods can be applied, using simple Metropolis-Hastings algorithm with restricted jumping distribution; those restrictions follow from SC and DC. If empirical proportion of correct responses falls withing the 95% hdi of estimate, we can assume the axioms are successfully tested.

### Example for [6:8, 1:3] 3x3 submatrix

Empirical proportions:

|            |` 1     `|` 2     `|` 3      `|
|------------|---------|---------|----------|
|` 6        `|` 0.127 `|` 0.279 `|` 0.639  `|
|` 7        `|` 0.166 `|` 0.466 `|` 0.850  `|
|` 8        `|` 0.170 `|` 0.851 `|` 1.000  `|

Estimated proportions with 95% hdi:

|            |` 1                      `|` 2                      `|` 3                     `|
|------------|--------------------------|--------------------------|-------------------------|
|` 6        `|` 0.067 - 0.117 - 0.170  `|` 0.196 - 0.282 - 0.369  `|` 0.538 - 0.633 - 0.729 `|
|` 7        `|` 0.106 - 0.166 - 0.226  `|` 0.346 - 0.469 - 0.589  `|` 0.750 - 0.838 - 0.922 `|
|` 8        `|` 0.131 - 0.219 - 0.303  `|` 0.725 - 0.839 - 0.926  `|` 1.000 - 1.000 - 1.000 `|

Total test / failed tests:

|            |` 1     `|` 2     `|` 3      `|
|------------|---------|---------|----------|
|` 6        `|` 1 / 0 `|` 1 / 0 `|` 1 / 0  `|
|` 7        `|` 1 / 0 `|` 1 / 0 `|` 1 / 0  `|
|` 8        `|` 1 / 0 `|` 1 / 0 `|` 0 / 0  `|
