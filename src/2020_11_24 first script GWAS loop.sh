## template plink script 
wdir="/no-backup/jolien/yourworkingdirectory"
covar=$wdir/covarfile 
trainings=$(seq 1 10)
for t in $trainings
do echo $t 
pheno=$wdir/phenotypefile.training$t.phen 
chromosomes=$(seq 1 22)
for chr in $chromosomes
do echo $chr
/home/hpc/jolien.rietkerk/bin/plink2 --bfile $bfile \
--pheno $pheno --glm hide-covar --covar-variance-standardize --covar $covar \
--out $wdir/chr$chr.training$t \
--memory 10000 --threads 1
done 
done 