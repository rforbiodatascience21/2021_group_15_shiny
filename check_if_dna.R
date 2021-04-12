library(stringr)

check_if_dna <- function(string){
  nucleotides <- c("A", "T", "G", "C")
  dna <- str_detect(string, "^[ATGCatcg]*$")
  return(dna)
}
