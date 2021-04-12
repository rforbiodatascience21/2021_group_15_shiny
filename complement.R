complement <- function(dna){
  lookup <- c("A" = "T", "T" = "A", "G" = "C", "C" = "G") 
  dna_split <- strsplit(dna, "")[[1]]
  dna_complement <- paste0(lookup[dna_split], collapse = "")
  return(dna_complement)
}