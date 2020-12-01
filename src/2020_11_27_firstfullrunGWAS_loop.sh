## template plink script

wdir="/no-backup/jolien/projectCI/2020_11_17_firstfullrun"
mkdir $wdir/src
mkdir $wdir/log

rm $wdir/src/*runGWAS*

covar="/projects/biobank/release2/pheno/allchr.unrelatedbritishqced.mafhwe.prunedld1.flashpca.20pcs.arrays.nowithdrawn.covar"

trainings=$(seq 1 10)
for t in $trainings
do echo $t
pheno="/home/hpc/jolien.rietkerk/data/MDD2.nowithdrawn.training${t}.phen"

chromosomes=$(seq 1 22)
for chr in $chromosomes
do echo $chr
bfile="/projects/biobank/release3/genotypes/ukb_imp_v3_chr${chr}.unrelatedbritishqced.maf001geno9"

echo -e "$wdir/log/chr${chr}.training${t}.log" >> $wdir/src/all_runGWAS
echo -e "$wdir/log/chr${chr}.training${t},log: $bfile\n\t\
/home/hpc/jolien.rietkerk/bin/plink2 --bfile $bfile \
--pheno $pheno --1 --glm hide-covar --covar-variance-standardize --covar $covar \
--out $wdir/chr$chr.training$t \
--memory 10000 --threads 1; \
touch $wdir/chr$chr.training$t.log" >>$wdir/src/runGWAS
done
done
/home/hpc/na.cai/src/make_all_files.py -i $wdir/src/all_runGWAS -o $wdir/src/all_runGWAS.sh
cat $wdir/src/runGWAS $wdir/src/all_runGWAS.sh > $wdir/src/runGWAS.sh
make --file $wdir/src/runGWAS.sh all -j 20



