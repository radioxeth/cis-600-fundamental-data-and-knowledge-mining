# Week 10 Alternative Cluster Analysis and Performance Evaluation
## Table of Contents
- [Week 1 Data Mining Overview](../week1/README.md)
- [Week 2 Data Types and Preparation](../week2/README.md)
- [Week 3 Data Exploration](../week3/README.md)
- [Week 4 Decision Tree Induction](../week4/README.md)
- [Week 5 Performance Evaluation](../week5/README.md)
- [Week 6 Bayes' Theorem](../week6/README.md)
- [Week 7 Other Classification Methods](../week7/README.md)
- [Week 8 Association Rule](../week8/README.md)
- [Week 9 Cluster Analysis: K-Means and Hierarchical](../week9/README.md)
- **&rarr;[Week 10 Alternative Cluster Analysis and Performance Evaluation](README.md)**

## Live Session


### Basics of Graph Theory

- a node (or vertex) is a fundamental unit in a graph representing entities such as objects, people, or sates. Nodes are often denoted as (V) in a graph
- an edge is a connectoin between two nodes representing relationships or interactoins between the entities. Edges are typically denoted as (E) and can be directed or undirected

Graph representation as a Set

- a graph (G) can be represented as a set of nodes and edges (G=(V,E))

For example, (V={v1,v2,v3}) and (E={(v1,v2),(v2,v3)}) where (V) is the set of nodes and (E) is the set of edges


#### DBSCAN
- Density-based spatial clustering of applications with noise (DBSCAN) is a center-based clustering algorithms
1. Label all points as core, border, or noise
2. Eliminate noise points
3. Put an edge between all core points within a distance Eps of each  other
4. Make each group of connected core points into a cluster
5. Assign each of border points to one of the clusters of its associated core points


- core points
  - points that are in the interior of a density based cluster, when it has n>=minpts within the eps radius
- border points
  - not a core point, but within the eps radius
- noise points
  - not a border point nor a core point


#### Minimum Spanning Tree

- a minimum spanning tree (MST) a graph between data points represented as nodes
  - only edge between pairs of nodes
  - no cycles in tree

#### Graph Clustering
- graph clustering algorithms use a minimum spanning tree (MST) to determine the sparsity of a graph
1. compute MST for the dissimilarity graph
2. DO
3.     create a new cluster by braking the link corresponding to the largest dissimilarity
4. WHILE only singletons or desired number of clusters remain

- good for data where features surround each other.