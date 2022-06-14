#' ---
#' title: "Remove older dates, leaving only new records"
#' author: "Leonie Heron"
#' date: "22/04/2022"
#' ---
#' 

search_001_remove_older_records = function(search_results) {
  
  #convert dates to date format
  search_results$`Entry Date` <- as.Date(as.character(search_results$`Entry Date`), 
                                         format = "%Y%m%d")
  
  #############################
  # for first WHO search only on 01.10.2021:
  # keep all records from 1 Jan 2022 onwards
   date1 <- "2021-10-01"
   new_records <- subset(search_results, 
                         `Entry Date` >= date1)
  #############################
  
  # 
  # #set dates of records we would like to keep
  # #every tuesday we will keep records with entry dates from the previous tuesday
  # #until monday (records from previous 7 days)
  # date1 <- Sys.Date() - 7
  # date2 <- Sys.Date() - 1
  # 
  # #keep only records from last week
  # new_records <- subset(search_results,
  #                       search_results$`Entry Date` >= date1 & search_results$`Entry Date` <= date2)

  return(as.data.frame(new_records))
  
}