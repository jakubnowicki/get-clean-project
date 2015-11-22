---
title: "README"
author: "Jakub Nowicki"
date: "22 listopada 2015"
output: html_document
---

Data have been read from recieved files (X_train.txt, X_test.txt). Vaariables have been renamed according to list from the features file (features.txt). Activities and subjects IDs have been read from files (y_train/test.txt and subject_train/test.txt) and attached  to the datasets. Data have been merged. Mean and standard deviation variables have been extracted (`grep` function was used to find colum numbers). "Freq" varibles have been excluded. Finaly activity number IDs have been replaced and substituted with full names.  
Summary has been generated from the tidy dataset using `group_by` and `summarise_each` functions from the `dplyr` package.