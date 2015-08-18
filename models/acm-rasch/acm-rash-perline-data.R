source("modules/index.R")
source("models/acm-rasch/modules/index.R")

source("data/irt-perline.R")

resultSC <- testSingleCancellation(n, N)
resultDC <- testDoubleCancellation(n, N)
resultSCDC <- testBothCancellations(n, N)