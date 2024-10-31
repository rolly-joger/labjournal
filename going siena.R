myeff_1 <- getEffects(the_data)
myeff_1 <- includeEffects(myeff_1, egoX, interaction1="interaction_race_covar")
myeff_1 <- includeInteraction(myeff_1, egoX, egoX, interaction1=c("h_index_covar", "white_pass_covar"))
myeff_1 <- includeInteraction(myeff_1, simX, simX, interaction1=c("h_index_covar", "white_pass_covar"))
mod_1_effects <- siena07(myAlgorithm, data = the_data, effects = myeff_1, returnDeps = TRUE)
mod_1_effects



myeff_1 <- getEffects(the_data)
myeff_1 <- includeInteraction(myeff_1, diffX, diffX, interaction1=c("h_index_covar", "country_covar"))
mod_1_effects <- siena07(myAlgorithm, data = the_data, effects = myeff_1, returnDeps = TRUE)
mod_1_effects 

?siena08

#uva ----
demographics_hannah_uva <- demographics_hannah %>%
  filter(
    Universiteit.22 == "UvA" |
    Universiteit1.22 == "UvA" |
    Universiteit2.22 == "UvA" |
    Universiteit.24 == "UvA" |
    Universiteit1.24 == "UvA" |
    Universiteit2.24 == "UvA" 
  )

#dependent variable 
net <- sienaDependent(net_soc_array)

#independent variable 
hoogleraar_covar_uva <-  coCovar(demographics_hannah_uva$hoogleraar)
functie_covar_uva <- coCovar(demographics_hannah_uva$functie)
gender_covar_uva <- coCovar(demographics_hannah_uva$perc_female)
country_covar_uva <- coCovar(demographics_hannah_uva$born_in_binary)
white_pass_covar_uva <- coCovar(demographics_hannah_uva$white_or_not)
h_index_covar_uva <- coCovar(demographics_hannah_uva$h_index)
interaction_race_covar_uva <- coCovar(demographics_hannah_uva$int_h_race)
interaction_ethnicity_covar_uva <- coCovar(demographics_hannah_uva$int_h_eth)
myeff_1 <- getEffects(the_data)
myeff_1 <- includeEffects(myeff_1)
mod_1_effects <- siena07(myAlgorithm, data = the_data, effects = myeff_1, returnDeps = TRUE)
mod_1_effects 
#eur ----
demographics_hannah_eur <- demographics_hannah %>%
  filter(
    Universiteit.22 == "EUR" |
      Universiteit1.22 == "EUR" |
      Universiteit2.22 == "EUR" |
      Universiteit.24 == "EUR" |
      Universiteit1.24 == "EUR" |
      Universiteit2.24 == "EUR" 
  )
#uu ----
demographics_hannah_uu <- demographics_hannah %>%
  filter(
    Universiteit.22 == "UU" |
      Universiteit1.22 == "UU" |
      Universiteit2.22 == "UU" |
      Universiteit.24 == "UU" |
      Universiteit1.24 == "UU" |
      Universiteit2.24 == "UU" 
  )
#ru ----
demographics_hannah_ru <- demographics_hannah %>%
  filter(
    Universiteit.22 == "RU" |
      Universiteit1.22 == "RU" |
      Universiteit2.22 == "RU" |
      Universiteit.24 == "RU" |
      Universiteit1.24 == "RU" |
      Universiteit2.24 == "RU" 
  )




