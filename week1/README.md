# Week 1 Data Mining Overview
## Table of Contents
- **&rarr;[Week 1 Data Mining Overview](README.md)**
- [Week 2 Data Types and Preparation](../week2/README.md)
- [Week 3 Data Exploration](../week3/README.md)
- [Week 4 Decision Tree Induction](../week4/README.md)
- [Week 5 Performance Evaluation](../week5/README.md)
- [Week 6 Bayes' Theorem](../week6/README.md)
- [Week 7 Other Classification Methods](../week7/README.md)
- [Week 8 Association Rule](../week8/README.md)
- [Week 9 Cluster Analysis: K-Means and Hierarchical](../week9/README.md)
- [Week 10 Alternative Cluster Analysis and Performance Evaluation](../week10/README.md)

## Data Mining Overview

### What is Data Mining?
- many definitions
  - automatically discovering useful information in large data repositories
  - nontrivial extraction of implicit, previously unknown, and potentially useful information from data

### Origins of Data Mining
- draws ideas form machine learning/AI, Statistics, and database systems

## CRISP-DM
- Cross Industry Standard Process for Data Mining
  - Business understanding
  - data understanding
    - data preparation
    - modeling
  - evaluation
  - deployment

### CRISP-DM: Phases
- Business understanding
  - project objectives and requirements understanding, data mining problem definition
- Data Understanding
  - Initial data collection and familiarization, data quality problems identification
- Data Preparation
  - Table, record, and attribute selection, data transformation and cleaning
- Modeling
  - Modeling techniques selection and application, parameters calibration
- Evaluation
  - business objectives and issues achievement evaluation
- Deployment
  - Result model deployment, repeatable data mining process implementation

### Phases and Tasks
- business understanding
  - determine business objectives
  - assess situation
  - determine data mining goals
  - produce project plan
- Data Understanding
  - collect initial data
  - describe data
  - explore data
  - verify data quality
- Data Preparation
  - Select data
  - clean data
  - construct data
  - integrate data
  - format data
- Modeling
  - select modeling technique
  - generate test design
  - build model
  - assess model
- Evaluation
  - Evaluate results
  - review process
  - determine next steps
- Deployment
  - Plan deployment
  - Plan monitoring and maintenance
  - produce final report
  - review project


## Classification

### Data Mining Task 1: Classification
- Real-world examples
  - admission funnel process: classify if an admit will decide to enroll
  - e-mail span filter: classify an incoming e-mail to either spam or not spam categories
  - bank loan decision: approve a loan request or not
  - news recommendation: whether or not a reader would like to read a news article.

  ```mermaid
  graph LR
  A[Training Set] --> B(Learn Classifier)
  B --> C[Model]
  D(Test Set) --> C
  ```

  ### Fraud Detection
  
  - fraud detection can be modeled as a classification problem
    - what is the goal? to predict fraudulent cases in credit card transactions
    - what is an example? an individual transaction
    - what are the target classes/categories? fraud or not?
    - where do training data come from? Bank experts had investigated a number of transactions and found out whether they were fraud or not
    - what attributes will be used for prediction?
      - how far from the transaction location to the account holder's home address
      - the time, cost and items of transaction

    
## Clustering

### Data mining task 2: Clustering
- A real-world example:
  - customer segmentation
    - goal: to find the subgroups among a large customer base
    - clustering approach:
      - collect some attributes about the customers, like their age, income, favorite brands and so on
      - calculate the similarity between the customers
      - cluster similar customers together
    - difference between clustering and classification. we don't know what kinds of customers are out there. so we don't have the target categories nor training data that classification algorithms require
    - clustering analysis is suitable for exploratory analysis for datasets that we don't know much about
    - interpretation of clusters

### Can a clustering model predict?
- clustering analysis is considered as a "descriptive analysis" because the main purpose is to summarize the existing data, not make a prediction.
- but clustering model can be used for prediction. eg after an admit pool is clustered into Enrolled and Not Enrolled clusters, given a new admin, we can predict which cluster this customer belongs to, based on his/her similarity with the members in each cluster
- clustering is called "unsupervised learning" and classification is called "supervised learning"

## Association Rule Mining

### Data Mining Task 3: Association Roles
- given a set of transactions, find
  - items that co-occur frequently
  - rules like "if a customer bought x, he or she would by y, too"

### Data Mining Task 4: Anomaly Detection
- Detect significant deviations from normal behavior
- applications:
  - credit card fraud detection
  - network intrusion detection
- can be modeled as a classification problem

## Regression

### Data Mining Task 5: Regression
- Example:
  - predict tomorrow's stock price based on the past price
  - work on continuous variables
  - usually covered in statistics class, not data mining class.

## Predictive vs Descriptive Data Mining
- predictive analysis
  - use some variables to predict unknown of future values of other variables: classification, regression
- descriptive analysis
  - derive patterns (correlations, trends, clusters, and anomalies) that summarize the underlying relationships in data
- sometimes the difference between descriptive and predictive analysis is not clear

### Descriptive Questions
- what are the average age and income difference between the customers who repsonded vs the non responders?
- is there a corelation between age and income
- what is the response rate of people with two or more children
- is there correlation between the number of children and the decision to buy PEP?

### Predictive Questions
- given a customer's demographical profile, what is the chance that he or she would buy the product PEP?


## Live Session

- Data
- Information
- Knowledge
- Wisdom

### what is data

- Data is a discrete value that represents information
  - a discrete value for information
- in computer science data is a discrete value that can be stored and recovered
- what are some examples of data?

### what is information
- information is something that can be sensed and measured
- in computer science terms it is a data with context
- what are some examples of information

### what is knowledge
- knowledge is a combination of information across multiple sources
- in computer science terms it is a field within AI that logically interprets data information
- what are some examples of knowledge?

### what is wisdom?
- wisdom is the ability to interpret data that is outside the scope of your direct knowledge
- in computer science terms it would being able to make interpretations of data that it hasn't seen before but can be drawn from other knowledge
- what are some examples of wisdom?