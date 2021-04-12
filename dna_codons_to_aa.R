dna_codons_to_aa_one_letter <- function(codons){
  std_code_table <- c("TTT" = "F", "TCT" = "S", "TAT" = "Y", "TGT" = "C",
                      "TTC" = "F", "TCC" = "S", "TAC" = "Y", "TGC" = "C",
                      "TTA" = "L", "TCA" = "S", "TAA" = "*", "TGA" = "*",
                      "TTG" = "L", "TCG" = "S", "TAG" = "*", "TGG" = "W",
                      "CTT" = "L", "CCT" = "P", "CAT" = "H", "CGT" = "R",
                      "CTC" = "L", "CCC" = "P", "CAC" = "H", "CGC" = "R",
                      "CTA" = "L", "CCA" = "P", "CAA" = "Q", "CGA" = "R",
                      "CTG" = "L", "CCG" = "P", "CAG" = "Q", "CGG" = "R",
                      "ATT" = "I", "ACT" = "T", "AAT" = "N", "AGT" = "S",
                      "ATC" = "I", "ACC" = "T", "AAC" = "N", "AGC" = "S",
                      "ATA" = "I", "ACA" = "T", "AAA" = "K", "AGA" = "R",
                      "ATG" = "M", "ACG" = "T", "AAG" = "K", "AGG" = "R",
                      "GTT" = "V", "GCT" = "A", "GAT" = "D", "GGT" = "G",
                      "GTC" = "V", "GCC" = "A", "GAC" = "D", "GGC" = "G",
                      "GTA" = "V", "GCA" = "A", "GAA" = "E", "GGA" = "G",
                      "GTG" = "V", "GCG" = "A", "GAG" = "E", "GGG" = "G")
  aa <- paste0(std_code_table[codons], collapse = "")
  return(aa)
}

dna_codons_to_aa_three_letter <- function(codons){
  std_code_table <- c("TTT" = "phe", "TCT" = "ser", "TAT" = "tyr", "TGT" = "cys",
                      "TTC" = "phe", "TCC" = "ser", "TAC" = "tyr", "TGC" = "cys",
                      "TTA" = "leu", "TCA" = "ser", "TAA" = "*", "TGA" = "*",
                      "TTG" = "leu", "TCG" = "ser", "TAG" = "*", "TGG" = "trp",
                      "CTT" = "leu", "CCT" = "pro", "CAT" = "his", "CGT" = "arg",
                      "CTC" = "leu", "CCC" = "pro", "CAC" = "his", "CGC" = "arg",
                      "CTA" = "leu", "CCA" = "pro", "CAA" = "gln", "CGA" = "arg",
                      "CTG" = "leu", "CCG" = "pro", "CAG" = "gln", "CGG" = "arg",
                      "ATT" = "ile", "ACT" = "thr", "AAT" = "asn", "AGT" = "ser",
                      "ATC" = "ile", "ACC" = "thr", "AAC" = "asn", "AGC" = "ser",
                      "ATA" = "ile", "ACA" = "thr", "AAA" = "lys", "AGA" = "arg",
                      "ATG" = "met", "ACG" = "thr", "AAG" = "lys", "AGG" = "arg",
                      "GTT" = "val", "GCT" = "ala", "GAT" = "asp", "GGT" = "gly",
                      "GTC" = "val", "GCC" = "ala", "GAC" = "asp", "GGC" = "gly",
                      "GTA" = "val", "GCA" = "ala", "GAA" = "glu", "GGA" = "gly",
                      "GTG" = "val", "GCG" = "ala", "GAG" = "glu", "GGG" = "gly")
  aa <- paste0(std_code_table[codons], collapse = ", ")
  return(aa)
}

dna_codons_to_aa_full <- function(codons){
  std_code_table <- c("TTT" = "phenylalanine", "TCT" = "serine", "TAT" = "tyrosine", "TGT" = "cysteine",
                      "TTC" = "phenylalanine", "TCC" = "serine", "TAC" = "tyrosine", "TGC" = "cysteine",
                      "TTA" = "leucine", "TCA" = "serine", "TAA" = "*", "TGA" = "*",
                      "TTG" = "leucine", "TCG" = "serine", "TAG" = "*", "TGG" = "tryptophan",
                      "CTT" = "leucine", "CCT" = "proline", "CAT" = "histidine", "CGT" = "arginine",
                      "CTC" = "leucine", "CCC" = "proline", "CAC" = "histidine", "CGC" = "arginine",
                      "CTA" = "leucine", "CCA" = "proline", "CAA" = "glutamine", "CGA" = "arginine",
                      "CTG" = "leucine", "CCG" = "proline", "CAG" = "glutamine", "CGG" = "arginine",
                      "ATT" = "isoleucine", "ACT" = "threonine", "AAT" = "asparagine", "AGT" = "serine",
                      "ATC" = "isoleucine", "ACC" = "threonine", "AAC" = "asparagine", "AGC" = "serine",
                      "ATA" = "isoleucine", "ACA" = "threonine", "AAA" = "lysine", "AGA" = "arginine",
                      "ATG" = "methionine", "ACG" = "threonine", "AAG" = "lysine", "AGG" = "arginine",
                      "GTT" = "valine", "GCT" = "alanine", "GAT" = "aspartic acid", "GGT" = "glycine",
                      "GTC" = "valine", "GCC" = "alanine", "GAC" = "aspartic acid", "GGC" = "glycine",
                      "GTA" = "valine", "GCA" = "alanine", "GAA" = "glutamic acid", "GGA" = "glycine",
                      "GTG" = "valine", "GCG" = "alanine", "GAG" = "glutamic acid", "GGG" = "glycine")
  aa <- paste0(std_code_table[codons], collapse = ", ")
  return(aa)
}
