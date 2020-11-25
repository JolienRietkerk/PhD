wdir="/no-backup/caina"
mkdir $wdir/src
mkdir $wdir/log
rm $wdir/src/*runGWAS*
covar=$wdir/covarfile
trainings=$(seq 1 2)
for t in $trainings
do echo $t
pheno=$wdir/phenotypefile.training$t.phen
chromosomes=$(seq 1 3)
for chr in $chromosomes
do echo $chr
echo -e "$wdir/log/chr$chr.training$t.log">>$wdir/src/all_runGWAS
echo -e "$wdir/log/chr$chr.training$t.log: $bfile\n\t\
/home/hpc/jolien.rietkerk/bin/plink2 --bfile $bfile \
--pheno $pheno --glm hide-covar --covar-variance-standardize --covar $covar \
--out $wdir/chr$chr.training$t \
--memory 10000 --threads 1; \
touch $wdir/log/chr$chr.training$t.log">>$wdir/src/runGWAS
done
done
/home/hpc/na.cai/src/make_all_files.py -i $wdir/src/all_runGWAS -o $wdir/src/all_runGWAS.sh
cat $wdir/src/runGWAS $wdir/src/all_runGWAS.sh >  $wdir/src/runGWAS.sh
make --file $wdir/src/runGWAS.sh all -j 20