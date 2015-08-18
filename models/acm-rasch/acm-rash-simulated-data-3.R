source("modules/index.R")
source("models/acm-rasch/modules/index.R")

source("data/irt-sum-table-2pl-1000(10)x20.R")

resultSC <- testSingleCancellation(n, N)
resultDC <- testDoubleCancellation(n, N)
resultSCDC <- testBothCancellations(n, N)