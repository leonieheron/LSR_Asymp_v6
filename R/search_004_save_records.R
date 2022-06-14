#' ---
#' title: "Save new records on computer and github"
#' author: "Leonie Heron"
#' date: "22/04/2022"
#' ---
#' 

search_004_save_records = function(new_redcap_records) {
  
  
  #filename
  filename <- paste0("./data/", "WHO_COVID_results_",timestamp,".csv")
 
  dir_create <- "./data"
  if (!dir.exists(dir_create)){
    dir.create(dir_create)
  } 
  
  #save to computer
  write.csv(new_redcap_records, filename)
  

}