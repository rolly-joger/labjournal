#----

unique(demographics$Universiteit.22)


all_data <- fcolnet(data = scholars, 
                    university = c("UU", "RUG", "UvA", "EUR",
                                    "Leiden", "RU", "VU", "UvT", "TU Delft",
                                    "UvH"),
                    discipline = c("sociology", "political science"),
                    waves = list(c(2015, 2019), c(2020, 2024)), type = c("first"))
df <- all_data$data
df_ego <- do.call(rbind.data.frame, df$demographics)


x <- data.frame(Naam = df_ego$Naam)

first_name <- sapply(strsplit(x$Naam, " "), `[`, 1)  # This code should work as a way to extract first names from the ego characteristics dataset



df_names <- data.frame(x, first_name, male = NA, female = NA)  # seem to have worked

head(df_names)

i <- 1
df_names$first_name[i]

gender_scraper.NV <- function(names = "names element", web_page = "https://nvb.meertens.knaw.nl/naam/is/") {
  
  names$first_name <- sapply(strsplit(names$Naam, " "), `[`, 1)  # This code should work as a way to extract first names from the ego characteristics dataset
  names$male <- NA
  names$female <- NA
  
  for (i in 1:nrow(names)) {
    
    # print(names$first_name[i])
    
    web_page <- read_html(paste0("https://nvb.meertens.knaw.nl/naam/is/", names$first_name[i]))
    
    table <- web_page %>%
      rvest::html_elements("body") %>%
      rvest::html_elements("table") %>%
      rvest::html_table()
    
    if (length(table) == 0) {
      
      print(length(table))
      
      names$male[i] <- NA
      names$female[i] <- NA
      
    } else {
      
      # print(table) print(table[[1]][[2,3]]) # Check if values for male are coherent and
      # accurate print(table[[1]][[6,3]]) # Check if values for female are coherent and
      # accurate
      
      names$male[i] <- as.numeric(ifelse(table[[1]][[2, 3]] == "--", 0, table[[1]][[2, 3]]))  # Make sure non-occurences are not registered as '--'
      names$female[i] <- as.numeric(ifelse(table[[1]][[6, 3]] == "--", 0, table[[1]][[6, 3]]))  # Make sure non-occurences are not registered as '--'
      
    }
    
  }  # end forloop
  
  names <- names %>%
    mutate(perc_female = case_when(is.na(female == TRUE) & is.na(male) == TRUE ~ NA, is.na(female) ==
                                     TRUE ~ 0, is.na(male == TRUE) ~ 1, .default = round((female/(male + female)), 2))) %>%
    select(!c(male, female, first_name))
  
  return(names)
  
  
}  # end function

# ?mutate() ?case_when
testing <- gender_scraper.NV(names = df_ego, web_page = "https://nvb.meertens.knaw.nl/naam/is/")
view(testing)

