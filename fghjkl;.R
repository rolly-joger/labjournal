
net1_g <- graph_from_adjacency_matrix(matrix_ru_soc, mode = c("undirected"))
in_network <- data.frame(net1_g)
demographics <- as.data.frame(demographics)
demographics$dep_col <- if_else(demographics$discipline.24 == "politicologie", "#D81B60", "#1E88E5")
gender_tested$gender_col <- if_else(gender_tested$perc_female > 0.5, "#FFC107", "#004D40")
# Adapting the node size to the number of citations
in_network$total_cites <- as.numeric(in_network$total_cites)
in_network$gender
# Plotting the network of wave 1

plot(net1_g, vertex.color = soc_df$gcol, vertex.label = soc_df$name, vertex.size = ifelse(!is.na(in_network$total_cites),
                                                                                          log(in_network$total_cites), 2), vertex.frame.color = "gray", vertex.label.color = "black", vertex.label.family = "Helvetica",
     vertex.label.cex = 0.7, vertex.label.dist = 0.8, edge.curved = 0.2, edge.arrow.size = 0.5)
title("The publication network of the sociology department of wave 1", cex.main = 1.2, col.main = "black",
      family.main = "Helvetica")