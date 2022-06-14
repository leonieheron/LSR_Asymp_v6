#' ---
#' title: "Run deduplication app"
#' author: "Leonie Heron"
#' date: "14/06/2022"
#' ---
#' 

search_002_deduplication = function(new_records) {
  
  
  result <- screen_duplicates(new_records)
  #### app instructions
  # choose grouping variables in Data settings: journal, type, and publication year
  # change function in Matching settings to fuzzdist, make lower case, and remove punctuation
  # click 'calculate duplicates' 
  # screen duplicates
  # be careful to leave preprints
  
  return(as.data.frame(result))
  
}