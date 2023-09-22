grad <- 0:2000

s <- sample(grad, 100)

for(i in 1:100){
  s1 <- sample(grad, 100)
  s <- cbind(s, s1)
}

d <- list()
for(i in 1:101){
  d[[i]] <- density(s[, i], n = 200,
                    from = 0, to = 2000)
}

png("Lat-long/Simulation-elevacion.png", width = 500, height = 300)
plot(d[[1]], ylim = c(0, 7e-04), main = "Especies en gradiente elevacional",
     xlab = "Elevación", ylab = "Frecuencia")
for(i in 2:101){
  lines(d[[i]]$x, d[[i]]$y, col = "grey")
}
lines(d[[1]]$x, d[[1]]$y)
dev.off()
