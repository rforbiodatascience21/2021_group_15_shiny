complement <- function(dna){
  lookup <- c("A" = "T", "T" = "A", "G" = "C", "C" = "G") # named vector, think key/value
  dna_split <- strsplit(dna, "")[[1]]
  dna_complement <- paste0(lookup[dna_split], collapse = "")
  return(dna_complement)
}