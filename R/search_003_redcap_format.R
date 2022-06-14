#' ---
#' title: "Convert results to redcap-friendly csv file"
#' author: "Leonie Heron"
#' date: "22/04/2022"
#' ---
#' 

search_003_redcap_format = function(result) {

  #remove unnecessary variables
  new_redcap_records <- result %>%
    select("ID", "Authors", "Title", "Abstract", "DOI", "Fulltext URL", 
           "Issue number", "Volume number", "Journal", "Database", 
           "Publication year")

  #change variable names to match redcap
  names(new_redcap_records) <- c("record_no", "authors", "title", "abstract", "doi", 
                          "url1", "issue", "volume", "journal", "source", 
                          "year")
  
  #change variables to match redcap format
  
  #add blank var for redcap ID
  new_redcap_records$record_id <- NA
  
  #source
  new_redcap_records <- new_redcap_records %>%
    mutate(
      source = ifelse(source == "PREPRINT-MEDRXIV", 1,
                         ifelse(source == "MEDLINE", 4,
                                ifelse(source == "EMBASE", 3,
                                       ifelse(source == "PREPRINT-BIORXIV", 2,
                                              5)))))
  
  #TODO
  #change author format to match current redcap format - Heron, LE;
  # https://towardsdatascience.com/a-gentle-introduction-to-regular-expressions-with-r-df5e897ca432
  # https://cheatography.com/davechild/cheat-sheets/regular-expressions/
  
  return(as.data.frame(new_redcap_records))
  
}