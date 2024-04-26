# Week 4 Decision Tree Induction
## Table of Contents
- [Week 1 Data Mining Overview](../week1/README.md)
- [Week 2 Data Types and Preparation](../week2/README.md)
- [Week 3 Data Exploration](../week3/README.md)
- **&rarr;[Week 4 Decision Tree Induction](README.md)**
- [Week 5 Performance Evaluation](../week5/README.md)
- [Week 6 Bayes' Theorem](../week6/README.md)
- [Week 7 Other Classification Methods](../week7/README.md)
- [Week 8 Association Rule](../week8/README.md)
- [Week 9 Cluster Analysis: K-Means and Hierarchical](../week9/README.md)
- [Week 10 Alternative Cluster Analysis and Performance Evaluation](../week10/README.md)

### Classification Task Framework
#### Classification: Definition
- Given a collection of records (training set):
  - each record contains a set of attributes; one of the attributes is the class (values are class labels)
- Find a model for class attribute as a function of the values of other attributes
- goal: *Previously unseen* records should be assigned a class as accurately as possible
  - a *test set* is used to determine the accuracy of the model. Usually, the given dataset is divided into training and test sets, with the training set used to build the model and test set used to validate it.

#### Classification Techniques
- there are a number of different classification techniques to build a model for classification
  - decision tree-based methods
  - rule-based methods
  - memory-based reasoning, instance-based learning
  - Naive Bayes and Bayesian belief networks
  - Support Vector Machines
- in this session, we illustrate classification tasks using decision tree methods

### Hunt's Algorithm
#### Decision Tree Induction
- many algorithms:
  - hunt's
  - CART
  - ID3, C4.5
- weka implemented two algorithms
  - simpleCART
  - J48 ( a java implementation of quinlan's C4.5)

#### General Structure of Hunt's Algorithm
- Let D_t be the set of training records that reach node t
- general procedure
  - if D_t contains records that belong the same class y_t, then t is a leaf node labeled as y_t.
  - if D_t contains records that belong to more than one class, use an attribute test to split the data into smaller subsets.
    - recursively apply the procedure to each subset

#### Tree Induction
- greedy strategy
  - split the records based on an attribute test that optimizes specified criterion
- issues
  - determine how to split the records
    - how to specify the attribute test condition
    - how to determine the best split
  - determine when to stop splitting

#### How to specify test condition
- depends on attribute types
  - nominal
  - ordinal
  - continuous
- depends on number of ways to split
  - two-way split
  - multiway split

#### Splitting Based on Categorical Attributes
- Multi-way split: use a many partitions as distinct values
- Binary split: divides values into two subsets. need to find optimal partitioning


#### Splitting Based on Continuous Attributes
- different ways of handling
  - Discretization to form an ordinal categorical attribute
    - static: discretize once at the beginning
    - dynamic: eg equal frequency or equal width
  - binary decision (A<v) or (A<=v)
    - consider all possible splits and find the best cut
    - can be more computationally intensive

### Determine the Best Split: Information Gain

#### How to Determine the Best Split
- greedy approach
  - nodes with homogeneous class distribution are preferred
- need a measure of node impurity


- DS1
  - C0: 5
  - C1: 5
nonhomogeneous/high degree of impurity

- DS2
  - C0: 9
  - C1: 1
homogeneous/low degree of impurity

#### General Procedure for Finding Split
- Measure impurity of target node t
- measure impurity of candidate split c_i
- $\text{improvement} = \text{impurity}(t)-\text{impurity}(c_i)$
- Objective: Find c_i that maximizes improvement

### Determine the Best Split: Impurity Measure
- impurity measures:
  - information gain (C4.5/J48)
  - Gini (used in CART)
- A commonly seen claim: studies have shown that the choice of impurity measures has little effect on the performance of decision tree algorithms

- information gain
  - a statistical measure that measures how well a given attribute separates the training examples according to their target classification
- entropy
  - a measure that characterizes the impurity of a collection of examples
  - given a collection S that contains positive (+) and negative (-) examples, p_i is the probability that an example belongs to Class i
  - $\text{entropy}(S)=-p_+log_2(p_+)-p_-log_2(p_-)$
  - a collection of 50 positive examples and 50 negative examples
  - a collection of 100 positive examples and 0 negative examples

#### Information Gain
- Information gain of Attribute A for data collection S: Gain(S,A)
  - P_i is the probability that an arbitrary example belongs to Class i
  - Values (A) is the set of all possible values for attribute A

  $\text{Entropy}(S)=-\sum_{i=1}^cp_i\log_2{p_i}$
  $\text{Gain}(S,A)=\text{Entropy}(S)-\sum_{v\in{\text{values}(A)}}\frac{|S_v|}{|S|}\times{\text{Entropy}(S_v)}$

#### Which attribute should be the first node?

- calculate the information gain (IG) for each attribute, choose the one with the highest IG
- let's start with "age" and see if the entropy gets smaller after using age to split the data

| age  | income  | student | credit_rating | buys_computer |
|------|---------|---------|---------------|---------------|
| <=30 | high    | no      | fair          | no            |
| <=30 | high    | no      | excellent     | no            |
| 31…40| high    | no      | fair          | yes           |
| >40  | medium  | no      | fair          | yes           |
| >40  | low     | yes     | fair          | yes           |
| >40  | low     | yes     | excellent     | no            |
| 31…40| low     | yes     | excellent     | yes           |
| <=30 | medium  | no      | fair          | no            |
| <=30 | low     | yes     | fair          | yes           |
| >40  | medium  | yes     | fair          | yes           |
| <=30 | medium  | yes     | excellent     | yes           |
| 31…40| medium  | no      | excellent     | yes           |
| 31…40| high    | yes     | fair          | yes           |
| >40  | medium  | no      | excellent     | no            |


1. Calculate the entropy of the entire training dataset S which contains 9 positive examples and 5 negative examples
2. count the numbers of possible examples (column p_i) and negative examples (column n_i) in each subset and then calculate the entropy for each subset, I(p_i,n_i)
3. calculate the weighted average entropy after using age to split the data into three subsets
   - <=30
   - 31..40
   - \>40
4. calculate the information gain of using age to split the data into three subsets
   - <=30
   - 31..40
   - \>40
5. repeat process for each attribute and then pick the attribute with highest IG as the first node

- repeat prior steps for the subsets
  - for subset (2,3) calculate IG for each attribute and pick the attribute with the highest IG
  - do the same for subset (3,2)
- until all nodes are pure with positive examples or all negative examples

#### Splitting Based on Gain Ratio
$\text{GainRATIO}_{\text{split}} = \frac{\text{GAIN}_{\text{split}}}{\text{SplitINFO}} \\
\text{SplitINFO} = -\sum_{i=1}^{k} \frac{n_i}{n} \log_2 \frac{n_i}{n}$

> parent node, p is split into k partitions. n_i is the number of records in partition i

- adjusts information gain by the entropy of the partitioning (splitINFO). Higher entropy partitioning (large number of small partitions) is penalized
- used in C4.5
- designed to overcome the disadvantage of information gain


###

## Live Session

### Decision Tree Overview
- Decision tree is a classification (or regression) algorithm that selects output based on a hierarchy of decision functions modeled on training input values
  - decision tress are directed acyclic graphs (DAG) where leafs are the output class values based on a given input
  - generally algorithms are used to make a decision function that is as balanced and short as possible
    - id3
    - classification and regression trees (CART)

#### Decision Tree Pros and Cons
- decision treen advantages
  - white box
  - easy to prune
- disadvantages
  - retraining is slow
  - cannot run in parallel
  - high computational complexity


#### Impurity Measure: Gini Impurity
- gini impurity measures how often a value will be incorrectly classified
$1-\sum_{i=1}^n{p_i^2}$
- p: probability of classification
- i: class
- n: number of classes

- lower is better
#### Impurity Measure: Entropy
$-\sum_{i=1}^n{p_i}\log_2{(p_i)}$
- p: probability of classification
- i: class
- n: number of classes

- lower is better


#### Classification and Regression Tree (CART)
- CART is an algorithm to optimize a decision tree based (generate a model)
  - training data (input feature vectors, output classes)
  - optimization functions try to minimize classification error and reduce complexity of decision tree
  - creates a binary decision tree for multiple classes
  - uses an impurity measure to find splits in the data
  - splits are found within each of the features (optimization of min impurity score)
  - recursively found from root to leafs
  - ideal stop criteria either no error

#### Information gain
- information gain is the difference in entropy as you split a set on a particular features (attribute)
- higher is better


#### ID3 Algorithm
- iterative dichotomiser 3 (ID3) is another technique to optimize decision trees
  - uses training data with attributes for training similar to CART
  - uses informatin gain as the metric for splitting
  - can do greater than 2 branches
- binary classification only (CART can do multiclass)
  - https://github.com/biggestT/ID3-decision-tree


#### Tree Pruning
- trees generally have very good performance, but are complex
- many times you'll see a knee in the performance
- one way to make trees more efficient is generally pruning the tree to an acceptable error rate



- wagner would
  - build a very correct decision CART tree
  - look at requirements
    - 