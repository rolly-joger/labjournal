#----
require(RSiena)
library(network)
friend.data.w1 <- s501
friend.data.w2 <- s502
friend.data.w3 <- s503
drink <- s50a
smoke <- s50s

net1 <- network::as.network(friend.data.w1)
net2 <- network::as.network(friend.data.w2)
net3 <- network::as.network(friend.data.w3)

# nacf does not row standardize!
snam1 <- sna::nacf(net1, drink[, 1], type = "moran", neighborhood.type = "out", demean = TRUE)
snam1[2]  #the first order matrix is stored in second list-element
#net ----
require(ape)
require(sna)
net_graph_w1 <- graph_from_adjacency_matrix(wave_1)
net_graph_w2 <- graph_from_adjacency_matrix(wave_2)
#degree w1----
hist(degree(net_graph_w1), breaks = 20)
hist(betweenness(net_graph_w1, directed = T), breaks = 20)
hist(closeness(net_graph_w1), breaks = 10)
#degree w2 ----
hist(degree(net_graph_w2), breaks = 20)
#density w1----
density_w1 <- edge_density(net_graph_w1)
density_w1
#density w2 ----
density_w2 <- edge_density(net_graph_w2)
density_w2 #bigger!!!
#reciprocity w1 ----
reciprocity(net_graph_w1, ignore.loops = TRUE, mode = c("default", "ratio"))
#reciprocity w2 ----
reciprocity(net_graph_w2, ignore.loops = TRUE, mode = c("default", "ratio"))
#degree centrality w1 ----
#degree centrality of white v. non-white people 
#degree centrality of dutch v. non-dutch people 
hist(degree(net_graph_w1), breaks = 20)
#degree centrality w2 ----
hist(degree(net_graph_w2), breaks = 20)
#betweenness centrality w1 ----
hist(betweenness(net_graph_w1, directed = T), breaks = 20)
#betweenness centrality w2 ----
hist(betweenness(net_graph_w2, directed = T), breaks = 20)
#clustering w1 ----
hist(igraph::transitivity(net_graph_w1, type = "local"), breaks = 20)
#clustering w2 ----
hist(igraph::transitivity(net_graph_w2, type = "local"), breaks = 20)
#average path length w1 ----
mean((ego_size(net_graph_w1, order = 2, mode = "out") - 1)/vcount(net_graph_w1))
#average path length w2 ----
mean((ego_size(net_graph_w2, order = 2, mode = "out") - 1)/vcount(net_graph_w2))
#segregation - wave 1 ----
#are nodes who are close to each other more alike?
geodistances_w1 <- geodist(wave_1, count.paths = TRUE)
geodistances_w1 <- geodistances_w1$gdist
# set the distance to yourself as Inf
diag(geodistances_w1) <- Inf
# step 2: define a distance decay function. This one is pretty standard in the spatial
# autocorrelation literature but actually pretty arbitrary.
weights_w1 <- exp(-geodistances_w1)
view(weights_w1) #what does this meannnnn
#moren
snam1_w1 <- sna::nacf(wave_1, demographics_hannah$perc_female, type = "moran", neighborhood.type = "out", demean = TRUE)
snam1_w1[2]
moran_result_jochem_w1 <- fMoran.I(demographics_hannah$perc_female, scaled = FALSE, weight = weights_w1, na.rm = TRUE, rowstandardize = FALSE)
moran_result_jochem_w1
#segregation- wave 2 ----
geodistances_w2 <- geodist(wave_2, count.paths = TRUE)
geodistances_w2 <- geodistances_w2$gdist
# set the distance to yourself as Inf
diag(geodistances_w2) <- Inf
weights_w2 <- exp(-geodistances_w2)
# step 2: define a distance decay function. This one is pretty standard in the spatial
# autocorrelation literature but actually pretty arbitrary.
weights_w2 <- exp(-geodistances_w2)
view(weights_w2) #what does this meannnnn
# step 3: Morens I
#moren
snam1_w2 <- sna::nacf(wave_2, demographics_hannah$perc_female, type = "moran", neighborhood.type = "out", demean = TRUE)
snam1_w2[2] #lower
moran_result_jochem_w2 <- fMoran.I(demographics_hannah$perc_female, scaled = FALSE, weight = weights_w2, na.rm = TRUE, rowstandardize = FALSE)
moran_result_jochem_w2 #lower but more significant



view(demographics_hannah)
