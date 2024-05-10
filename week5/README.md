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

#### Model Overfitting
- two fundamental concepts
  - training error: train a model on a training dataset, then test the model on the same training set the error rate is called training error, which evaluates how well the model fits the training data
  - test error: test the model on a test dataset that is different from the training set. the error rate is called test error, which evaluates how well the model generalizes unseen data.

- Overfitting means a model fits the training data very well, but generalizes to unseen data poorly
- how do I know if my model is overfitting?
  - your model is overfitting if its training error is small (fits well with training data) but the test error is large (generalizes poorly to unseen data)

#### Model Overfitting
- generally speaking, complex models are more likely to overfit than simple models

#### Occam's Razor

- given two models of similar generalization errors, on should prefer the simpler model of the more complex model
- for complex models there is a greater chance that they are fitted accidentally by errors in data
- therefore, one should include model complexity when evaluating a model

### Model Evaluation Methods

#### Methods for Performance Evaluation
- how to obtain a reliable estimate of performance.
- performance of a model may depends on other factors besides the learning algorithm
  - class distribution
  - cost of misclassification
  - size of training and test sets

#### Holdout Test
- process
  - split the training data to two subsets, using one subset for training, and the other for testing
  - the splitting ration is determined by the training set size in that both subsets cannot be too small
  - 50/50 or 2:1 are common splitting ratios
- random subsampling
  - repeat the holdout method to improve the estimation of the performance

#### Cross-Validation
- N equal-sized folds. Run the evaluation N times, each time using one fold for testing and the rest for training
- the averaged error rate over N folds is the final generalization error
  - N is determined by the training set size. The larger the N, the longer it takes to run the experiments
  - five or 10 are common choices for N

#### Holdout Test vs Cross-Validation
- holdout test 
  - pros: fast
  - cons: high variability in the result depending on the split
- cross validation
  - pros: less variability and thus more reliable error estimation
  - cons: takes longer time


#### Leave one Out

- leave one out: an extreme case of cross-validation
  - in the extreme case, N equals the training set size S, meaning the experiment is run S times, each time one example is used for testing and all others for training
- advantage
  - no variability in the test result (always get the same result)
- shortcoming
  - the most time-consuming method
  - usually used on very small datasets

#### Bootstrap
- the training records (size N) are sampled with replacement
- training data: a bootstrap sample of size N contains 63.2% of the original data
- testing data: remaining records in the original data
- repeat b times to generate b bootstrap samples and b number of $\epsilon_i$
- overall accuracy: .632 bootstrap

$$-\frac{1}{b}\sum_{i=1}^{b}(0.632\times{\epsilon_i}+0.368\times{acc_s})$$

## Live Session
- performance evaluation
- hyperparameter tuning

### ideal model generation and evaluation
- model generation steps ideal world (all data sets are sequestered from each other)
  - create the model -> use training data to create model
  - validate the model -> use validation data to evaluate model performance
  - test the model -> use test data to predict model performance in situ
- in a perfect world there will be enough data to create and evaluate the performance of your models
  - 80-15-5 break down of data
    - 80% of data for training
    - 15% for validation
    - 5% for testing

### sub-ideal model generation and evaluation

- data is hard/expensive to collect and there may not be enough data to have squestered data

- "bootstraping" model evaluation techniques can be used
  - resubstitution - validate on training data
  - n-fold cross-validation - partition data in n groups to validate performance

- performance results are sub-optimal but give you something to work with

### Resubstitution

- resubstiution is an evaluation technique that use the training data to create your model to get a performance score
  - also called test-on-train

- this the theoretical upper bound of performance of your model
- useful to see if you can even meet performance requirements for model
  - if you can't meet the requirements, then you need a different model likely

### N-fold cross validation

- n-fold cross-validation is an evaluation approach that breaks data into n bins for multiple evaluations of models for the data set
  - data is randomly placed into n bins
  - iteratively where i=1...n, bin i is selected as the tet set and the other bis are combined for training data
  - a model is build for the non-i bins and tested on bin i for a score
  - this step is repeated for all bins
  - model performance is the average measurement across all test bin iterations

### Leave-one-out evaluation

- leave-one-out is a special case of n-fold cross-validation where there are m data samples and n bins
- evaluation value used to represent worst case performance of model of test data
- generally, when n>8 for n-fold cross-validation has close enough performance to leave one out


### Hyperparameter selection

- a hyperparameter are parameters that can be tuned before training to make a model
  - neural networks
    - nodes and layers
    - activation functions
    - connectivity
  - support vector machines
    - kernel function
    - kernel parameters
    - optimization
  
- n-fold cross-validation, resubstitution can be used for parameter optimization


### proposal
transformers
long short term 