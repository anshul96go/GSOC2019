library("ggplot2")
library("animint")
devtools::install_github("faizan-khan-iit/ggplot2@5fb99d0cece13239bbbc09c6b8a7da7f86ac58e2")
devtools::install_github('rOpenSci/gistr')
devtools::install_github("tdhock/animint", upgrade_dependencies=FALSE)
library(animint)
library(dplyr)

#library("ggplot2")
data(tips, package = "reshape2")
tips$sex_smoker <- with(tips, interaction(sex, smoker))
p <- ggplot() +
  geom_point(data = tips, 
             aes(x = tips$total_bill, y = tips$tip, colour = tips$sex_smoker))
p

#library("animint2")
#animint2dir(list(plot = p), out.dir = "simple", open.browser = FALSE)

p1 <- ggplot() + theme(legend.position = "none") +
  geom_point(data = tips,   
             aes(x = sex, y = smoker, colour = tips$sex_smoker, clickSelects = tips$sex_smoker),
             position = "jitter")
p2 <- ggplot() +
  geom_point(data = tips,  
             aes(x = total_bill, y = tip, 
                 colour = tips$sex_smoker, showSelected = tips$sex_smoker))


plots <- list(plot1 = p1, plot2 = p2)
#structure(plots, class = "animint2")


animint2gist(plots, description ="Year Joined vs Age Vs Gender in Pseudo Facebook Data")

