# Week 5 Performance Evaluation
## Table of Contents
- [Week 1 Data Mining Overview](../week1/README.md)
- [Week 2 Data Types and Preparation](../week2/README.md)
- [Week 3 Data Exploration](../week3/README.md)
- [Week 4 Decision Tree Induction](../week4/README.md)
- **&rarr;[Week 5 Performance Evaluation](README.md)**
- [Week 6 Bayes' Theorem](../week6/README.md)
- [Week 7 Other Classification Methods](../week7/README.md)
- [Week 8 Association Rule](../week8/README.md)
- [Week 9 Cluster Analysis: K-Means and Hierarchical](../week9/README.md)
- [Week 10 Alternative Cluster Analysis and Performance Evaluation](../week10/README.md)

### Traditional Model Performance Metrics: Accuracy

#### Problem with Accuracy Measure
- we need to learn some fundamental concepts first:
  - confusion matrix for two classes (can be extended to multiple classes)

|                | **Predicted Class=Yes** | **Predicted Class=No** |
|----------------|:-----------------------:|:----------------------:|
| **Actual Class=Yes** | a (True Positive)        | b (False Positive)       |
| **Actual Class=No**  | c (False Negative)       | d (True Negative)        |


#### Accuracy Definition based on confusion matrix

$accuracy=\frac{a+d}{a+b+c+d}=\frac{TP+TN}{TP+TN+FP+FN}$

#### Metrics for model Performance
- accuracy is the most common measure, but it has limitations, especially on a skewed dataset
- what is a skewed dataset?
  - in two class problem
    - number of class 0 examples = 9990
    - number of class 1 examples = 10
- if a model predicts everything to be class 0, accuracy is 9990/10000=99.9%
  - accuracy is misleading because the trivial model does not detect any Class 1 examples

#### Baselines for Model Evaluation
- two common baselines for comparison:
  - **random guess**: if there are two categories, a model based on random guess would result in 50% accuracy
  - **majority vote**: if the dataset is skewed, a trivial model would assign all test data to the larger category
- nontrivial model is expected to outperform the common baselines

### Precision and Recall


#### Two Types of Error
- example: to classify if a student is going to buy new computer or not, based on some data collected about the students. Mail coupons to potential buyers.
- assume the confusion matrix of the prediction result looks as follows:

|                | **Predicted: Buy_Computer = Yes** | **Predicted: Buy_Computer = No** | **Total** |
|----------------|:---------------------------------:|:--------------------------------:|:---------:|
| **Actual: Buy_Computer = Yes** | 6954                              | 46                                | 7000      |
| **Actual: Buy_Computer = No**  | 412                               | 2588                              | 3000      |
| **Total**                     | 7366                              | 2634                              | 10000     |


#### Precision and Recall
- for a company, one type of error might be more costly than the other
  - eg, one would rather send out more coupons than miss a potential buyer
  - eg, one would rather tolerate some junk mail in inbox than risking misclassify a regular mail to junk
- the accuracy measure does not differentiate these two types of errors, but precision and recall do


#### Cost Matrix

|                 | **Predicted: Class=Yes** | **Predicted: Class=No** |
|-----------------|:-------------------------:|:-----------------------:|
| **Actual: Class=Yes** | C(Yes\|Yes)                   | C(No\|Yes)                  |
| **Actual: Class=No**  | C(Yes\|No)                    | C(No\|No)                   |

C(i|j): cost of misclassifying class j example as class i

#### Cost vs Accuracy

|count             | **Predicted: Class=Yes** | **Predicted: Class=No** |
|-----------------|:-------------------------:|:-----------------------:|
| **Actual: Class=Yes** | a                    | b                 |
| **Actual: Class=No**  | c                    | d                   |

|cost             | **Predicted: Class=Yes** | **Predicted: Class=No** |
|-----------------|:-------------------------:|:-----------------------:|
| **Actual: Class=Yes** | p                    | q                  |
| **Actual: Class=No**  | q                    | p                   |


$cost = p(a+d)+q(b+c)$
$=p(a+d)+q(N-a-d)$
$=qN-(q-p)(a+d)=$
$N[q- (q-p)\times{}\text{accuracy}]$

### Precision and Recall

#### Precision

$precision=\frac{a}{a+c}=\frac{TP}{TP+FP}$

> Among all positive **predictions**, how many are correctly predicted

#### Recall

$recall=\frac{a}{a+b}=\frac{TP}{TP+FN}$

> Among all positive **examples**, how many are correctly predicted

#### F-Measure
- an ideal model would achieve high precision and recall on all categories
  - but in reality precision and recall are like two sides of a see0saw: if one goes up, the other might go down
  - f-measure is a weighted average of precision and recall

$F=\frac{2\times{}precision\times{}recall}{precision+recall}$

### Model Overfitting and Occam's  Razor Principle