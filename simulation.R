suppressWarnings(library(arm))

n <- 1000
p <- 100

x <- matrix(rnorm(n * p), ncol = p)

pr1 <- arm::invlogit(rowSums(x)) # all x's informative
pr2 <- arm::invlogit(x[,1]) # Only x1 informative

f <- function(x, pr) {
  y <- rbinom(nrow(x), 1, prob = pr)
  suppressWarnings(mod <- glm(y ~ x, family=binomial()))
  return(mod$coef[2])
}

reps <- 100

save1 <- rep(-99999, reps)
save2 <- rep(-99999, reps)
system.time(for (i in seq_len(reps)) {
  save1[[i]] <- f(x, pr1)
  save2[[i]] <- f(x, pr2)
})

matrix(c(median(save1), median(save2), IQR(save1), IQR(save2)),
       byrow = TRUE, nrow = 2,
       dimnames = list(c("median", "IQR"), c("all x", "only x1")))
