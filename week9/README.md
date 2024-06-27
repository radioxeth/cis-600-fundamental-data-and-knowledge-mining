# Week 9 Cluster Analysis: K-Means and Hierarchical
## Table of Contents
- [Week 1 Data Mining Overview](../week1/README.md)
- [Week 2 Data Types and Preparation](../week2/README.md)
- [Week 3 Data Exploration](../week3/README.md)
- [Week 4 Decision Tree Induction](../week4/README.md)
- [Week 5 Performance Evaluation](../week5/README.md)
- [Week 6 Bayes' Theorem](../week6/README.md)
- [Week 7 Other Classification Methods](../week7/README.md)
- [Week 8 Association Rule](../week8/README.md)
- **&rarr;[Week 9 Cluster Analysis: K-Means and Hierarchical](README.md)**
- [Week 10 Alternative Cluster Analysis and Performance Evaluation](../week10/README.md)

## Live Session

Unsupervised learning/clustering

- K-means clustering
- Hierarchical clustering


### Supervised vs Unsupervised Learning
- supervised
  - during training you know the outcome of the inputs
  - optimize the model to reduce classification error
  - neural networks (feed forward), decision trees
- unsupervised
  - during training you do not know the class of the inputs
  - group items together by relationship of features
  - neural networks (auto-encoders), clustering

### Clustering
- clustering algorithms for the most part use euclidean distance functions to group together objects by the similarity (distance) of data's features
- k-means
- hierarchical
- graph
- DBSCAN

#### K-means clustering
- k-means clustering groups together data with similar features using the distance from k groups
- the clustering is iterative
  - stops when the number of iterations is reached OR
  - mean points don't change
- initial cluster means are usually randomly set
- every point in training set is classed with closest cluster means
- means recalculated based on mean point of class
- repeat until stop criteria

#### Hierarchical Clustering
- Hierarchical clustering has the user define the clustering algorithm, but the threshold to cluster groups together is defined by distance between groups of clusters
- grouping decision is made by the distance between groups of clusters iteratively
  - complete linkage - clusters based on max distance between clusters
  - single linkage 
  - average linkage


### Difference Between Probability and Likelihood
- Definition
  - probability: measure of the likelihood that an event will occur
    - given a fiar die, probability of rolling 3 is 1/6
  - likelihood: measure of how likely observed data is given different parameter values
    - given observed rolls, likelihood of the die being fair

- functionality
  - probability: P(X=x|&Theta;)
    - &Theta; is fixed, X varies
  - likelihood: L(&Theta;|X=x)
    - X=x is fixed, &Theta; varies