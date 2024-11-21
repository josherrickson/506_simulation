library(parallel, quietly = TRUE, warn.conflicts = FALSE)
library(parallelly, quietly = TRUE, warn.conflicts = FALSE)
library(future, quietly = TRUE, warn.conflicts = FALSE)
library(arm, quietly = TRUE, warn.conflicts = FALSE)

cat("Number of cores detected :", detectCores(), "\n")
cat("Number of cores available:", availableCores(), "\n")

n <- 1000
p <- 100

x <- matrix(rnorm(n * p), ncol = p)

pr1 <- invlogit(rowSums(x)) # all x's informative
pr2 <- invlogit(x[,1]) # Only x1 informative

f <- function(x, pr) {
  y <- rbinom(nrow(x), 1, prob = pr)
  suppressWarnings(mod <- glm(y ~ x, family=binomial()))
  return(mod$coef[2])
}

plan(multisession)
reps <- 100

save1 <- list()
save2 <- list()
system.time(for (i in seq_len(reps)) {
  save1[[i]] <- future(f(x, pr1), seed = TRUE)
  save2[[i]] <- future(f(x, pr2), seed = TRUE)
})

save1 <- sapply(save1, value)
save2 <- sapply(save2, value)

matrix(c(median(save1), median(save2), IQR(save1), IQR(save2)),
       byrow = TRUE, nrow = 2,
       dimnames = list(c("median", "IQR"), c("all x", "only x1")))
