# DATA SETUP

# Load trees.csv using the read.csv() function
trees <- read.csv('trees.csv')

# DESCRIPTIVE STATISTICS

# Calculate the Mean of the columns in the trees dataset
treeMeans <- colMeans(trees)

# Calculate the Median of the columns in the trees dataset
treeMedians <- colMedians(trees)

# Calculate the Standard Deviation of the columns in the trees dataset
treeSDs <- apply(trees, MARGIN = 2, sd)

# Calculate the Inter-Quartile Range of the columns in the trees dataset
treeIQR <- IQR(trees)


# GRAPHING

# Generate a Box Plot of the columns in the trees dataset
boxplot(trees)

# Generate a Histogram of the columns in the trees dataset
hist(trees)

# Generate a Scatter Plot of the columns in the trees dataset
plot(trees)

# Generate a Parallel Coordinates Plot of the columns in the trees dataset
library(parallel)
parallelcoord(trees)

# Generate a 3D Scatter Plot of the columns in the trees dataset
library(plot3D)
scatter3D(trees)


# CORRELATION

# Calculate the Pearson Correlation Coefficients for the columns in the trees dataset
cor(trees)

# Calculate the Spearman’s rank Correlation Coefficients for the columns in the trees dataset
library(Hmisc)
rcorr(trees)

# Calculate the Kendall’s Tau Correlation Coefficients for the columns in the trees dataset
library(psych)
corr.test(trees, method="kendall")


# CLUSTERING

# Generate a clustering dendrogram from the columns in the trees dataset
library(dendextend)
d <- as.dist(1-cor(trees))
hc <- hclust(d, method="ward.D")
dend <- as.dendrogram(hc)
plot(dend, main="Clustering Dendrogram for Trees")

# Generate a Cluster Analysis for the columns in the trees dataset
library(stats)
clusterTrees <- kmeans(trees, centers=3)

# Generate a Principal Components Analysis for the columns in the trees dataset
library(psych)
pcaTrees <- principal(trees, nfactors=3, rotate="varimax")

# Generate a Factor Analysis for the columns in the trees dataset
library(psych)
faTrees <- fa(trees, nfactors=2, rotate="varimax")