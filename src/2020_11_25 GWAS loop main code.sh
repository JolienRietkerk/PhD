##template PLINK script
wdir = "no-backup/jolien/yourworkingdirectory"

covar = "${wdir}/covarfile"

training = $(seq 1 10 )

for t in $training
do echo $t
pheno = "${wdir}/phenotypefile.training${t}.pheno"
chromosomes = $(seq 1 10 )

for chr in $chromosomes
do echo $chr
bfile = "${chr}.train${t}.phen"
/home/hpc/jolien.rietkerk/bin/plink2 --bfile $bfile \
--pheno $pheno --glm hide-covar --covar-variance-standardize \
--covar $covar --out "${wdir}/chr${chr}.training${t}" \
--memory 10000 --threads 1
done
done

#will it automatically know to do not take the pheontypes that are not in the binary file?
#I will still have to make 10 splits of the binary data file and get it to merge 9 of them into a trianing set that is used for training. The one left out of the fold is then 
#the one $ at that moment. 
