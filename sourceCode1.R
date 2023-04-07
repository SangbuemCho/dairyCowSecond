getwd()
library(tidyverse)
dat <- dft
indx <- id2

# select cow including pairty 1 and DIM below 7 days data
dat[dat$parity == 1 & dat$DIM < 7, ] -> m
runId <- unique(m$id)
x <- runId[2]
# body weight scaling function
foo1 <- function(x){
  oo <- dat[dat$id == x, ]
  min(oo[oo$parity == 1, 'DIM']) -> minDIM
  initBW <- oo[oo$parity == 1 & oo$DIM == minDIM, 'bw']
  oo %>%
    mutate(scaledBw = bw - initBW[[1]] + 600) -> out
  return(out)
}

lapply(runId, foo1) %>% 
  do.call('rbind', .) %>%
  as.data.frame() -> dt # running data for bw prediction model 









 



