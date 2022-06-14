#' ---
#' title: "Initialize"
#' author: "Leonie Heron"
#' date: "22/04/2022"
#' ---

#' Load packages
#' 
library(dplyr)
library(RSelenium)
library(RCurl)
library(readxl)
library(stringr)
library(readr)
library(RefManageR)
library(bibtex)
library(revtools)
library(RecordLinkage)

#' Tag
timestamp = gsub("-| |:","",Sys.time())

#Encoding
options(encoding="utf-8")

#' Paths
path_function = "R/"
path_saveoutput = "output/"

#TODO 
#add when functions complete

#' Add custom functions to env
files_functions = list.files(file.path(path_function),full.names = TRUE, include.dirs = TRUE)
files_functions = files_functions[!grepl(pattern = "000|backup",files_functions)]
sapply(files_functions, source)
rm(files_functions)

