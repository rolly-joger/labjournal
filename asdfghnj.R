#packages ----
library(RsienaTwoStep)
library(RSiena)
library(tidyverse)

#----
my_good_data_a <- sienaDataCreate(net, gender_covar)
myeff <- getEffects(my_good_data_a)
view(myeff)
#----
#undirected ties -- manuals, wat voor soort dingen doen we (zie manual, make an informed choice!!!!)
myeff_2 <- includeEffects(myeff, density)
myeff_3 <- includeEffects(myeff_2, inPop, outAct)
myeff_4 <- includeEffects(myeff_3, sameX, egoX, altX, interaction1 = "white_pass_covar")
#myeff_5 <- includeEffects(myeff_4, sameX, egoX, altX, interaction1 = "gender_covar")

#algorithm ----
myAlgorithm <- sienaAlgorithmCreate(projname = "myeff_3_t2", modelType = c("net" =3))
mod_1_whitepass <- siena07(myAlgorithm, data = my_good_data_a, effects = myeff_3, returnDeps = TRUE)
mod_1_whitepass
?sienaAlgorithmCreate

my_good_data_a <- sienaDataCreate(net)
myeff <- getEffects(my_good_data_a)
myeff

myeff_2 <- includeEffects(myeff, density)
myAlgorithm <- sienaAlgorithmCreate(projname = "boiiii")
mod_1_whitepass <- siena07(myAlgorithm, data = my_good_data_a, effects = myeff_2, returnDeps = TRUE)
mod_1_whitepass


gofi0 <- sienaGOF(ansM1, Geo, verbose = FALSE, join = TRUE, varName = "net")

