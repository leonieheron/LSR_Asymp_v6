#' ---
#' title: "Overview"
#' author: "Leonie Heron"
#' date: "22/04/2022"
#' ---
#' 
#' ## Function loading of cleaned variables
# check initialize file if you installed all packages (open R/comix_000_initialize.R)
source("./R/search_000_initialise.R")

## Run search on WHO Covid database
latest_search <- "export_20220531.csv"
search_results <- read_csv(latest_search)

## Remove older dates, leaving only new records
new_records = search_001_remove_older_records(search_results)

## Run de-duplication app
result = search_002_deduplication(new_records)
#### app instructions
# choose grouping variables in Data settings: journal, type, and publication year
# change function in Matching settings to fuzzdist, make lower case, and remove punctuation
# click 'calculate duplicates' 
# screen duplicates

## Convert results to redcap-friendly csv file
new_redcap_records = search_003_redcap_format(result)

## Save new records on computer and github
search_004_save_records(new_redcap_records)

#ready for upload to redcap

#remove functions
rm(search_001_remove_older_records)
rm(search_002_deduplication)
rm(search_003_redcap_format)


