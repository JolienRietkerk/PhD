library(dplyr)

#Put the argument that was added after the RScript thiscript.R run:
args = commandArgs(trailingOnly=TRUE)
print(args)
#args[1] should be file name
#args[2] should be chromosome number

## Set file paths and variables
GWAS_basepath <- "/no-backup/jolien/projectCI/2020_11_17_firstfullrun/results_GWAS" 
GWAS_tailpath <- args[1]
GWAS_path <- paste0(GWAS_basepath,"/", GWAS_tailpath)
chr <- args[2]
training <- args[3]
INFO_path <- paste0("/projects/biobank/release3/qc/chr",chr,".unrelatedbritishqced.snp-stats")
MAF_path <- paste0("/projects/biobank/release3/genotypes/ukb_imp_v3_chr",chr,".unrelatedbritishqced.maf001geno9.frq")

#Read the data into memory
GWASdata <- read.delim(GWAS_path)
INFOdata<- read.delim(INFO_path)
MAFdata <- read.table(MAF_path, header = TRUE)

# remove duplicate SNPs from GWAS data: count the SNPIDs
UniqueGWAS <- GWASdata %>% group_by(ID) %>% filter(n() == 1)

# get only ID - INFO columns from the file
INFOdata <- INFOdata %>% rename(ID = RSID, INFO = information)
ID_INFO <- INFOdata %>% select(ID,INFO)

rm(INFOdata)

# get only ID - MAF columns from the other file
MAFdata <- MAFdata %>% rename(ID = SNP)
ID_MAF <- MAFdata %>% select(ID,MAF)

rm(MAFdata)

## An innerjoin keeps observations that appear in both tables.
## An outer join keeps observations that appear in at least one of the tables

# inner_join the GWAS and INFO by ID, and MAF by ID,
# then add the BETA column
BASE <- GWASdata %>% 
  inner_join(ID_INFO, by="ID") %>%
  inner_join(ID_MAF, by="ID") %>%
  mutate(BETA =log(OR))



#Make sure all colnames are right. Do this last because BASE needs SNP instead
#of ID, which is the Key for joining. 
BASE <- BASE %>% rename(CHR = X.CHROM, A2 = REF, N = OBS_CT, SE = LOG.OR._SE, SNP = ID, BP = POS)


write.table(BASE, file=paste0("chr", chr, ".training", training , ".glm.logistic.hybrid"), sep="\t")

#merge the files per trianing, for even and odd using the next R script..
#then gzip them. 