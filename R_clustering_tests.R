

library(factoextra)
library(clustertend)
library(seriation)

# Load the data
data("faithful")
df <- faithful
head(df)

library("ggplot2")
ggplot(df, aes(x=eruptions, y=waiting)) +
      geom_point() +  # Scatter plot
      geom_density_2d() # Add 2d density estimation

# Generate random dataset
set.seed(123)
n <- nrow(df)
random_df <- data.frame(
      x = runif(nrow(df), min(df$eruptions), max(df$eruptions)),
      y = runif(nrow(df), min(df$waiting), max(df$waiting)))
# Plot the data
ggplot(random_df, aes(x, y)) + geom_point()


library(factoextra)
set.seed(123)
# K-means on faithful dataset
km.res1 <- kmeans(df, 2)
fviz_cluster(list(data = df, cluster = km.res1$cluster),
             frame.type = "norm", geom = "point", stand = FALSE)


# K-means on the random dataset
km.res2 <- kmeans(random_df, 2)
fviz_cluster(list(data = random_df, cluster = km.res2$cluster),
             frame.type = "norm", geom = "point", stand = FALSE)

# Hierarchical clustering on the random dataset
fviz_dend(hclust(dist(random_df)), k = 2,  cex = 0.5)

# ============================================================================== #
#                       METHODS FOR ACESSING CLUSTERING TENDENCY                 #
# ============================================================================== #
# i) Statistical (Hopkins statistic)
# ii) Visual methods (Visual Assessment of cluster Tendency (VAT) algorithm 

# ==> Hopkins statistic <==
#  If the value of Hopkins statistic is close to zero, 
# then we can reject the null hypothesis and conclude that 
# the dataset D is significantly a clusterable data.
# requires(clustertend )
# Compute Hopkins statistic for faithful dataset
set.seed(123)
hopkins(faithful, n = nrow(faithful)-1)
# Compute Hopkins statistic for a random dataset
set.seed(123)
hopkins(random_df, n = nrow(random_df)-1)

# ==> VAT: Visual Assessment of cluster Tendency <==
set.seed(1680) # for reproducibility


library("seriation")
# faithful data: ordered dissimilarity image
df_scaled <- scale(faithful)
df_dist <- dist(df_subset) 
dissplot(df_dist)


set.seed(123)
km.res <- kmeans(df_subset, 20)
dissplot(df_dist, labels = km.res$cluster)


library(dplyr) # for data cleaning
library(ISLR) # for college dataset
library(cluster) # for gower similarity and pam
library(Rtsne) # for t-SNE plot
library(ggplot2) # for visualization
#library(dbscan)# for clustering
library(fpc)
# Import data
data <- read.csv('C:\\Users\\aepedrosa\\Desktop\\ML_works\\big_table_take2.csv')
df_subset <- data[,c('Temp3avg_entrada','Temp7avg_entrada','Hum3avg_entrada','Hum7avg_entrada','Nr_eventos','Nr_pedidos','Nr_analises','Nr_infoclis')]

# Deall with na
df_subset[df_subset==-1]<- NA
df_subset<- df_subset[complete.cases(df_subset), ]

# Chgange variable types
# complete_data <- df_subset
# complete_data$Genero <- factor(complete_data$Genero)
# complete_data$Hospital <- factor(complete_data$Hospital)
# complete_data$Dep_entrada <- factor(complete_data$Dep_entrada)
# complete_data$Subdep_entrada <- factor(complete_data$Subdep_entrada)

# Compute distance
gower_dist <- daisy(df_subset,metric = "gower")
summary(gower_dist)
gower_mat <- as.matrix(gower_dist)
df_subset[
      which(gower_mat == min(gower_mat[gower_mat != min(gower_mat)]),
            arr.ind = TRUE)[1, ], ]


# 

db <- dbscan(df_subset,eps=0.05,showplot=TRUE)
plot(db,df_subset)
plot(db,complete_data)
plotcluster(df_subset[,-5],db$cluster)





clusters <- hclust(dist(df_subset))

# 
eps_value <- 2  # maximum radium distance
minpts_value <- 
db <- dbscan(complete_data, eps = 0.42, MinPts = 5)




