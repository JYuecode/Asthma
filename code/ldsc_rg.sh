# Asthma=/home/data1/Asthma/Asthma_eas/Asthma_eas.sumstats.gz
# for file in `ls /home/data1/Asthma/eas_Blood/Blood_format/*gz`
# do
# base_file=$(basename $file .sumstats.gz)
# python /home/software/ldsc/ldsc.py \
# --ref-ld-chr /home/software/ldsc/eas_ldscores/ \
# --out "asthma_"$base_file \
# --rg $Asthma,$file \
# --w-ld-chr /home/software/ldsc/eas_ldscores/ &
# done

Asthma=/home/data1/Asthma/Asthma_eas/Asthma_new_eas.sumstats.gz
for file in `ls /home/data1/Asthma/eas_Blood/Blood_format/*gz`
do
base_file=$(basename $file .sumstats.gz)
python /home/software/ldsc/ldsc.py \
--ref-ld-chr /home/software/ldsc/eas_ldscores/ \
--out "asthma_new_"$base_file \
--rg $Asthma,$file \
--w-ld-chr /home/software/ldsc/eas_ldscores/ &
done

for log in `ls /home/wqf/relevance`
do
tail -n 4 $log | head -n 1 >> 
done