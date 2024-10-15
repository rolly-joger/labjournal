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
#write_rds(test, "all_my_data.rds")
#write_rds(df_soc, "all_my_data_soc.rds")
#write_rds(net, "all_my_network.rds")
```


# Independent Variable 

```{r}
#create DF
demographics_my_data <- df_soc[[1]]
demographics_my_data <- as.data.frame(do.call(rbind, demographics_my_data))
Naam <- subset_gender[,1]
last_columns_gender <- subset_gender[,c(22:24)]
usable_gender <- cbind(Naam, last_columns_gender)
usable_gender <- usable_gender %>%
  drop_na(born_in)
usable_gender_2 <- left_join(demographics_my_data, usable_gender, by = "Naam")
view(usable_gender_2)

#Make Binary Variables 
usable_gender_2 <- usable_gender_2 %>%
  mutate(
    born_in_binary = ifelse(born_in == "Netherlands", 1, 0)
  )
usable_gender_2 <- usable_gender_2 %>%
  mutate(
    hoogleraar = ifelse(Functie.24 == "Hoogleraar", 1,0),
  )
usable_gender_2 <- usable_gender_2 %>%
  mutate(
    functie = as.factor(Functie.24)
  ) 
usable_gender_2 <- usable_gender_2 %>%
  mutate(
    functie = as.numeric(functie))
view(usable_gender_2)

#Independent-Shaped
hoogleraar_covar <-  coCovar(usable_gender_2$hoogleraar)
functie_covar <- coCovar(usable_gender_2$functie)
gender_covar <- coCovar(usable_gender_2$perc_female)
country_covar <- coCovar(usable_gender_2$born_in_binary)
white_pass_covar <- coCovar(usable_gender_2$white_or_not)
```

```{r }
#write_rds(usable_gender_2, "gender_demographics.rds")
```


# Get Effect Structure 

```{r}
my_good_data_a <- sienaDataCreate(net)
myeff <- getEffects(my_good_data_a)
myeff
```

# Initial Description

```{r}
ifelse(!dir.exists("results"), dir.create("results"), FALSE)
print01Report(my_good_data_a, modelname = "./results/prelimsh*t")  
```

# Specify Model 

```{r}
myeff
myeff_2 <- includeEffects(myeff, density, recip)
view(myeff_2)
myeff_3 <- includeEffects(myeff_2, isolateNet, inPop, outAct)
myeff_4 <- includeEffects(myeff_3, sameX, egoX, altX, interaction1 = "white_pass_covar")
```

# Estimate Model 

```{r}
myAlgorithm <- sienaAlgorithmCreate(projname = "prelimnshit3")
mod_1_whitepass <- siena07(myAlgorithm, data = my_good_data_a, effects = myeff_2, returnDeps = TRUE)
mod_1_whitepass
gofi0 <- sienaGOF(mod_1_whitepass, IndegreeDistribution, verbose = FALSE, join = TRUE, varName = "net")
plot(gofi0, main = "") #0 - 8 is how we estimate indegrees
#se's are based on simulation
``