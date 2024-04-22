# Week 3 Data Exploration
## Table of Contents
- [Week 1 Data Mining Overview](../week1/README.md)
- [Week 2 Data Types and Preparation](../week2/README.md)
- **&rarr;[Week 3 Data Exploration](README.md)**
- [Week 4 Decision Tree Induction](../week4/README.md)
- [Week 5 Performance Evaluation](../week5/README.md)
- [Week 6 Bayes' Theorem](../week6/README.md)
- [Week 7 Other Classification Methods](../week7/README.md)
- [Week 8 Association Rule](../week8/README.md)
- [Week 9 Cluster Analysis: K-Means and Hierarchical](../week9/README.md)
- [Week 10 Alternative Cluster Analysis and Performance Evaluation](../week10/README.md)

## Data Exploration

### Summary Statistics

#### Exploratory Data Analysis
- a preliminary exploration of the data to better understand its characteristics
- key motivations of data exploration include
  - helping to select the right tool for preprocessing or analysis
  - making use of humans' abilities to recognize patterns
    - people can recognize patterns not captured by data analysis tools
- topics
  - summary statistics
  - visualization
  - On-Line Analytical Processing (OLAP)

#### Business Intelligence and Analytics (BI&A)
- BI&A is the business solution for an integrated knowledge discovery and decision support system
  - data warehouse, data mart
    - dimensional modeling and star schemas
    - in-memory database
  - data summary, reporting, and visualization
  - advanced analytics algorithms

#### Summary Statistics
- different statistic measures for different variable types
  - numerical
  - categorical
- common summary statistics
  - measure of location 
  - data spread

#### Frequency and Mode
- the notions of frequency and mode are typically used with categorical data
- the frequency of an attribute value is the percentage of time the value occurs in the dataset
- the mode of an attribute is the most frequent attribute value

#### Measure of Location
- values of a variable spread in a range
  - eg the values of a variable "people's ages" range form 0 to 100+
- central tendency means a value that represents the central or typical position
  - note the term central tendency is commonly used in statistics, though it is not used in the textbook
- common measure of central tendency 
  - mean
  - median
  - mode

#### Central Tendency of Different Types of Variables
- numerical variables
  - mean, mode, median, percentile
  - 


### Outlier Resistance Analysis and Multivariate Techniques

#### Measures of Spread

- Range: min-max
- interquartile range
  - Quartile: Q1 (25%), Q2 (50%), Q3 (75%)
    - temperature = [55,55,56,58,60,60,60,61,70,72,74]
    - Q3-Q1=70-56=14
- variance/standard deviation

$$\text{variance}=s_x^2=\frac{1}{m-1}\sum_{i=1}^{m}(x_i-\bar{x})^2$$

#### Outlier-resistance Analysis
- outlier sensitive measures
  - mean, variance, standard deviation, range
- outlier-resistant measures:
  - median
  - IQR
  - MAD

- trade-off: computing cost to sort values
- rule of thumb: use visualization techniques to evaluate and identify outliers, then choose appropriate summary statistics to report

#### From Univariate to Multivariate Analysis
- measures central tendency and spread of individual variables
- measure relationship between variables
  - Pearson correlation between two numerical variables
    $$r = \frac{\sum (x_i - \overline{x})(y_i - \overline{y})}{\sqrt{\sum (x_i - \overline{x})^2}\sqrt{\sum (y_i - \overline{y})^2}}$$
    - range from 0-1, 1 is stronger relationship
  - chi-square independence test between two categorical variables.
$$\chi^2 = \sum_{i=1}^{n} \frac{(O_i - E_i)^2}{E_i} = N \sum_{i=1}^{n} P_i \left( \frac{O_i/N - p_i}{p_i} \right)^2$$

- x^2 is the chi-square statistic
- n is the number of categories or classes
- O_i represents the observed frequency for class i
- E_i represents the expected frequency for class i
- N is the total number of observations
- P_i is the probability of class i under the null hypothesis
- p_i is the proportion of observations in class i in the data

### Data Visualization Introduction
#### Data Visualization: Link Data and Questions

- benefits of visualization
  - know data better
  - visually discover data pattern
  - prepare for more targeted data exploration
- choice of right chart and graph
- desired features
  - interactive (vs static)
  - holistic (vs isolated)

#### Cycle of Visual Data Mining
- cycle of visual data mining
  - a highly flexible unpredictable, and cyclical process of question and answer involving many tasks
    - discovering data and visual structure
    - finding patterns and outliers
    - deriving causal relationships
    - etc

#### How to design right visualization?

ACCENT principles
- apprehension
- clarity
- consistency
- efficiency
- necessity
- truthfulness


#### Empower Visual Expressiveness
- start with data structures
  - number and type variables
- match visualization techniques with data structure
  - chart type
  - color
  - size
  - shape
  - dashboard

### Common Chart Types
#### Bar Chart
  - compare data across different categories
#### Line Chart
  - display trends over a period of time
    - time series or longitudinal data
#### Histogram
  - understand the distribution of your data
    - test different groupings or "bins" of data that make sense
#### Box Plot
  - show distribution of the data:
    - check skewness of distribution; detect outliers
#### Pie Chart
  - show relative proportion or percentage of information
#### Bubble Chart
  - accentuate data on scatter plot by adding additional layer of continuous variable to visualize
    - can overlay on map to inform data in geographical context effectively
#### Heat Map
  - show the relationship between two categorical attributes through varying colors
  - Highlight table: add numbers on top of heat map to provide additional details

### Dashboard

#### Combine Different TYpes of Charts in One Visualization
- leverage strength of various type of charts to visualize multivariate dataset
  - eg line chart effective to show change over time; bar chart intuitive to compare difference of quantity; combine two to maximize benefits

#### Dashboard: Put Visuals Together for Holistic View
- visual display of the most important information from multiple views:
  - consolidated in one place;
  - integrated for maximal insights

### Multidimensional Data Modeling

#### Online Analytical Processing (OLAP)
- data representation: table (in relational database) vs multidimensional array (in OLAP)
- conducive for data analysis and exploration
- compare to OLTP (online transaction processing)

#### Creating a multidimensional array
- key steps to prepare multidimensional array
  - identify dimensional attributes a nd target attribute
    - dimensional attributes: discrete value
    - target attribute: count of continuous values
  - calculate value of each entry in the multidimensional array by summing the values (of the target attribute) or count of all objects that have the attribute values corresponding to that entry

#### Make a data cube
- make a cube with 3 dimensions of categories and slice a category to see what defines that category


### Various OLAP Operations for Data Cube

#### OLAP Operations: Data Cube
- data cube: multidimensional representation of data with aggregates
- possible aggregates: results of selecting a subset of dimensions and aggregate over all remaining dimensions
- for iris data example: choose species type dimensions and sum of all other dimensions

#### Data Cube Example
- sale data example: records the sales of production a number of company stores at various dates
- various three dimensional array representations of this sel dataset
  - 2d aggregates
  - 1d aggregates
  - 0d aggregates

#### OLAP Operations: Slicing and Dicing
- slicing: specify a specific value for one or more dimensions
- dicing: specify a range of attribute values
  - equivalent to defining a subarray
- both operations include aggregation of some dimensions

#### OLAP Operations: Roll up and drill down
- attribute with hierarchical structure
  - examples: time location product category
  - categories often nest and form a tree or lattice
- this hierarchical structure enables the roll up and drill down operations
  - for sales data, roll up daily sales to monthly sales
  - conversely, drill down monthly sate numbers to daily granularity
  - likewise, roll-up and drill-don can be performed for location and product category dimensions

## Live Session

### Data Visualization

#### Spreadsheets

- a table for data compilation and storage of data
- spreadsheets are ood for basic visualization a


#### Programming Language
- many interpreted languages have visualization tools built into them for visualization of data
- if you know the programming language you can make good visualization

- examples
  - matlab
  - r
  - python with matplotlib
  - octave

> in python you can make a correlation plot to compare features/dimensions correlation. Discard highly correlated features

#### Databases
- many database GUIs have visualization tools built into them
- database visualization can be a good way to show relationships of data
- digital thread tools are in many instances use graph database visualization
- examples
  - anzo
  - kobai
  - neo4j
  - data dog

### Assignment 1

