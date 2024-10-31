#----

library(tidyverse)
view(subset_gender)

subset_gender %>%
  group_by(Universiteit.24) %>%
  select(white_or_not) %>%
  table() %>%
  prop.table() %>%
  round(2)
library(psych)
describe(subset_gender)


library(labelled)
library(forcats)
test <- fcolnet(data = scholars,
                university = c("RU", "UU", "UvA", "EUR"), 
                discipline = "sociology",
                waves = list(c(2015, 2018), c(2019, 2023)),
                type = c("first"))
df_soc <- test$data
df_network <- test$nets
length(df_network)

wave_1 <- df_network[1,,]
wave_2 <- df_network[2,,]
net_soc_array <- array(data = c(wave_1, wave_2), dim = c(dim(wave_1), 2))

net <- sienaDependent(net_soc_array)