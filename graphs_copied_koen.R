#define the waves 
wave_1 <- graph_from_adjacency_matrix(wave_1)
wave_2 <- graph_from_adjacency_matrix(wave_2)
plot(wave_1,
     vertex.label = NA,
     vertex.size = 7,
     edge.curved = 0.2,
     edge.arrow.size = 0.1,
     main = "Network in Wave 1")
plot(wave_2,
     vertex.label = NA,
     vertex.size = 7,
     edge.curved = 0.2,
     edge.arrow.size = 0.1,
     main = "Network in Wave 2")

indegr_w1 <- degree(wave_1, mode = "in")
indegr_w2 <- degree(wave_2, mode = "in")

isolates_w1 <- V(wave_1)[degree(wave_1, mode = "all") == 0]

noisolates_w1 <- delete_vertices(wave_1, isolates_w1)

plot(noisolates_w1,
     vertex.label = NA,
     vertex.size = 10,
     vertex.color = "blue",
     vertex.frame.color = "black",
     edge.curved = 0.2,
     edge.arrow.size = 0.4,
     edge.color = "gray",
     edge.width = 0.3,
     main = "Network at wave 1 without isolates")


isolates_w2 <- V(wave_2)[degree(wave_2, mode = "all") == 0]

noisolates_w2 <- delete_vertices(wave_2, isolates_w2)

plot(noisolates_w2,
     vertex.label = NA,
     vertex.size = 10,
     vertex.color = "blue",
     vertex.frame.color = "black",
     edge.curved = 0.2,
     edge.arrow.size = 0.4,
     edge.color = "gray",
     edge.width = 0.3,
     main = "Network at wave 2 without isolates")
# GGRaphs for Waves

```{r}
### wave 1

indegr_w1 <- degree(wave_1, mode = "in")

# assign h-index to scholar
V(wave_1)$h_index <- demographics_hannah$h_index
V(wave_1)$indegree <- indegr_w1

#remove isolates
noisolates_w1 <- delete.vertices(wave_1, V(wave_1)[degree(wave_1) == 0])

#set size of plot
options(repr.plot.width = 20, repr.plot.height = 20)

#plot wave 1
ggraph(noisolates_w1,
       layout = "fr") +
  geom_edge_link(color = "gray", width = 0.5) +
  geom_node_point(aes(size = indegree, color = h_index)) + 
  scale_size(range = c(3, 10)) + 
  scale_color_gradient(low = "lightblue", high = "blue") + 
  theme_void() +
  labs(title = "Network wave 1: no isolates, node size based on indegrees & colour based on H-index")
``