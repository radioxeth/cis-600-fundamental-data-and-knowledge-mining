# Week 2 Data Types and Preparation
## Table of Contents
- [Week 1 Data Mining Overview](../week1/README.md)
- **&rarr;[Week 2 Data Types and Preparation](README.md)**
- [Week 3 Data Exploration](../week3/README.md)
- [Week 4 Decision Tree Induction](../week4/README.md)
- [Week 5 Performance Evaluation](../week5/README.md)
- [Week 6 Bayes' Theorem](../week6/README.md)
- [Week 7 Other Classification Methods](../week7/README.md)
- [Week 8 Association Rule](../week8/README.md)
- [Week 9 Cluster Analysis: K-Means and Hierarchical](../week9/README.md)
- [Week 10 Alternative Cluster Analysis and Performance Evaluation](../week10/README.md)

### Attribute Types and Properties

#### What is data?
- collection of data objects and their attributes
- attribute: property or characteristic of an object
- a collection of attributes describe an object

#### How to Prepare Data for Analysis?
- understand meaning of data
- assess the quality of data
- transform data for analysis

#### Attribute Types
- Four main types of attributes
  - categorical (qualitative)
    - nominal
    - ordinal
  - numeric (quantitative)
    - interval
    - ratio

#### Properties of Attribute Values
- the type of an attribute depends on which of the following properties it possesses:
  - distinctness
  - order
  - addition
  - multiplication
  - nominal attribute: distinctness
  - ordinal attribute: distinctness and order
  - Interval attribute: distinctness, order, and addition
  - ratio attribute: all four properties

### Attribute Discretization

#### How many values can an attribute have?
- discrete
  - finite: limited number of possible values
    - eg attribute a person's home country can have as many as ~300 values
  - countably infinite: the number of values is infinite but countable
    - eg people's id number
  - binary attribute
- continuous
  - real numbers like temperature, height, weight

#### Discretization
- some data analysis methods cannot process continuous attributes (eg decision tree)
- discretization is a process to transform a continuous attribute to a discrete one
  - eg family income
  - conversion rules
    - target categories (low medium high)
    - calculate average family income AVG
```js
if (income > 2 * AVG) {
  new_income_value = "high";
} else if (income < 0.5 * AVG) {
  new_income_value = "low";
} else {
  new_income_value = "medium";
}
```

### Data Issues

#### Data Quality
- what kinds of data quality problems?
- how can we detect problems with the data
- what can we do about these problems
- examples of data quality problems:
  - noise and outliers
  - missing values
  - duplicate data

#### Noise
- noise refers to modification of original values
- risk of overfitting

#### outliers
- outliers are data objects with characteristics that are considerably different from most of the other data objects in the dataset

#### missing values
- why are there missing values?
  - information is not collected (eg other people decline to give their age and height)
  - attributes may not be applicable to all cases (eg annual income is not applicable to children)
- handling missing values
  - eliminate data objects
  - estimate missing values
  - ignore the missing value during analysis
  - replace with all possible values (weighted by their probabilities)

#### duplicate data
- dataset may include data objects that are duplicates or almost duplicates of one or another
  - major issue when merging dta from heterogeneous sources
- example
  - same person with multiple email addresses
- data cleaning
  - process of dealing with duplicate data issues

### data transformation

- aggregation
- attribute transformation
- sampling
- dimensionality reduction and feature selection

#### Aggregation
- combining two or more attributes (or objects) into a single attribute (or object)
- purpose
  - data reduction
    - reduce number of attributes or objects
  - change of scale
    - cities aggregated into regions, states, countries etc
  - more stable data
    - aggregated data tend to have lass variability


#### Attribute Transformation
- sometimes the original values of an attribute need to be transformed for analysis purpose
- some common transformation:
  - discretization
  - simple transformation function: log(x), e^x, x^k, |x|, 1/x
  - normalization and standardization
    - z-score
    - min-max

#### Discretization without using class labels
- data
- equal interval
- equal frequency
- k-means

#### Discretization using class labels
- entropy-based approach

#### Log Transformation

#### z-score transformation

- converts scores into the distance in standard deviation units from the mean, with negative values being below the mean and positive values being above the mean

#### Benefits of z-score transformation
- because z-scores are in standard unites
  - you can compare positions across different variables that use different units of measurement. (you can compare apples with oranges)
  - you can quickly see if the position of an individual relative to the distribution is similar or different

#### Max-min standardization
- methods
  - f(x)=(x-min)/(max-min)
- benefits
  - standardize the range of all the numerical attributes to [0,1]
  - preserve the same ordering through transformation
  - easy to interpret.

#### Data Sampling
- why sampling?
  - sampling when obtaining or analyzing the entire set of data of interest is too expensive or time consuming
  - and the same is representative, meaning it has approximately the same property (of interest) as the original set of data.
  - therefore, the analysis results on the sample data may be reliably generalized to the entire dataset.

#### Sampling Methods
- a sampling problem: to sample 300 college students at SU to study their social media use patterns
  - **convenience sampling**
    - pick 300 engineering students. Of course you can pick students from other departments/schools, but it is convenient for you to find engineering students
  - **random sampling**
    - randomly pick 300 students in the engineering school
  - **stratified sampling**
    - stratify/partition engineering students to different groups, such as undergrad, masters, doctoral students, and sample 100 from each group
  - **systematic sampling**
    - sort student's SUID numbers in increasing order, pick the 1st, 11th, 21st... students until 300 students are sampled

#### Sample size

#### Steps of Data Analysis Preparation
- understanding the meaning of data
- assess the quality of data
- transform data for analysis



### Sampling with/without replacement
- **sampling without replacement**
  - one item would occur in the sample at most once
- **sampling with replacement**
  - one item may occur in the sample multiple times

## Live Session

### Data Type
 
- Data collection - grouping of data objects
- Data object - collection of data attributes
  - (object in programming language is a collection of attributes/data types and a method)
- Attribute - Measurable description relative to object

### Attributes
- an attribute is a value that varies between objects and is unique so to that object
- the number of attributes is an object is the dimensionality of the object

### Data Quality and Quantity for Model Generation
- Classification and regression models tend to be more accurate when there is more representative data
  - how the data samples are selected is important (quality)
  - how much data to select (quantity)


### The curse of dimensionality

- as you add more features to a data set, your model is more likely to overtrain on the data you have to make your model

- as more features (dimensions) are added, the data gets further apart
- so as you increase the dimensionality of the models you need to roughly exponentially increase the data size
  - rule of thumb: n=num features use $2^n$ data points

### Overfitting
- overfitting is when you have a model that is more complex than can be accurately modelled with the data you have
  - performance is worse when using data that you didn't train on
  - two ways to fix overfitting
    - collect more data AND/OR
    - Make less complex model (use less parameters)

### Random Sampling
- Random sampling of data for selection of data is the general default
  - uniformly random values - with unknown amount of data
  - **monte carlo sampling** - with known number of evenly spaced values

### Adaptive Sampling
- select samples more frequently areas where you want higher accuracy
  - generally start with random sampling and refine as more data comes in

  - partial derivatives with monte carlo sampling for higher dimensionality