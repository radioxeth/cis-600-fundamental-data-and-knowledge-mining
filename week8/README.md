# Week 8 Association Rule
## Table of Contents
- [Week 1 Data Mining Overview](../week1/README.md)
- [Week 2 Data Types and Preparation](../week2/README.md)
- [Week 3 Data Exploration](../week3/README.md)
- [Week 4 Decision Tree Induction](../week4/README.md)
- [Week 5 Performance Evaluation](../week5/README.md)
- [Week 6 Bayes' Theorem](../week6/README.md)
- [Week 7 Other Classification Methods](../week7/README.md)
- **&rarr;[Week 8 Association Rule](README.md)**
- [Week 9 Cluster Analysis: K-Means and Hierarchical](../week9/README.md)
- [Week 10 Alternative Cluster Analysis and Performance Evaluation](../week10/README.md)

### Introduction to Frequent Pattern Mining

#### Association Rule Mining
- given a set of transactions, find rules that will predict the occurrence of an item based on the occurrences of other items in the transaction

| TID | Items                     |
|-----|---------------------------|
| 1   | Bread, Milk               |
| 2   | Bread, Diaper, Beer, Eggs |
| 3   | Milk, Diaper, Beer, Coke  |
| 4   | Bread, Milk, Diaper, Beer |
| 5   | Bread, Milk, Diaper, Coke |

Example of association rules
- {bread}&rarr;{milk}
- {diaper}&rarr;{beer}
- {milk,bread}&rarr;{eggs,coke}

Implication means co-occurrence, not causality!

#### What is frequent pattern analysis?
- frequent pattern
  - what products do people buy together? beer and diapers?
  - what would people buy after buying a pc?
- applications
  - basket data analysis, catalog design, and DNA sequence analysis
  - product recommendation
    - amazon, google...

#### Association Rule Mining

| Transaction-id | Items Bought  |
|----------------|---------------|
| 10             | A, B, D       |
| 20             | A, C, D       |
| 30             | A, D, E       |
| 40             | B, E, F       |
| 50             | B, C, D, E, F |

- which two items are often bought together
- which three items are often bought together

#### Definition: frequent itemset
- itemset
  - a collection of one or more items
  - k-item set contains k items
- 1-itemset:
  - A:3, B:3, C:2, D:4, E:3, F:2
- 2-itemset:
  - AB:1, AD:3
- 3-itemset:
  - ABC: 0


### Association Rule Metrics: Confidence

#### Definition: Association Rule
- rule evaluation metrics
  - support 
    - fraction of transactions that contain both X and Y
    - support({E,F}->{B}) = support_count({B,E,F})/N = 2/5
  - confidence
    - measures how often items in Y appear in transactions that contain X
    - confidence({E,F}->{B}) 
    - = support({B,E,F})/support({E,F})
    - = support_count({B,E,F})/support_count({E,F})
    - = 2/2=1

#### Association Rule Mining Task
- given a set of transactions T, the goal of association rule mining is to find all rules having:
  - support >= min_sup threshold
  - confidence >= min_conf threshold


## Live Session

Association rules

### Association Rules?

- what are the association rules?
  - if-ten statements that help show probability of relationships between items in a transactional databases
- rule format {X}->{Y}
  - if you see set X, how often do you see set Y?

### Association rule metrics
- support: how often items appear in the data

$$s(X\rarr{Y})=\frac{\sigma(X\union{Y})}{N}$$

- confidence: how often the rules are tru

$$c(X\rarr{Y})=\frac{\sigma(X\union{Y})}{\sigma{X}}$$

Lift: what is the ration of confidence vs inferred response
$$l(X\rarr{Y})=\frac{c(X\union{Y})}{s{Y}}$$

- s(Y) is the probability of a transaction with Y

### Use Cases
- Medicine: determine conditionally probability of illness based on symptom associations
- retail: determine which products are bought together eg recommend items
- entertainment: streamers can recommend new media based on media others have watched before
- web site design: predict probability of next pages based on previous page views


#### more info
https://ieeexplore.ieee.org/document/7012882?arnumber=7012882