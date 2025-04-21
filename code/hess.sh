#!/bin/bash
GWAS_ID=GCST90002375

for i in $(seq 1 22);
do
    python /home/software/hess/hess.py --bfile /home/ref/ref/1000G_Phase3_EAS_plinkfiles/1000G.EAS.QC."$i" --local-rhog /home/data1/Asthma/Asthma_Blood_matg/data2/Asthma_new_"$GWAS_ID".txt /home/data1/Asthma/Asthma_Blood_matg/data2/"$GWAS_ID"_Asthma_new.txt --partition /home/software/hess/ldetect-data/ASN_SYC/fourier_ls-chr"$i".bed --out hess_result/"$GWAS_ID"/Asthma_new_"$GWAS_ID"_NO --chrom "$i"  
done 

#    python /home/software/hess/hess.py --bfile /home/ref/ref/1000G_Phase3_EAS_plinkfiles/1000G.EAS.QC.1 --local-rhog /home/data1/Asthma/Asthma_Blood_matg/data/Asthma_new_"$GWAS_ID".txt /home/data1/Asthma/Asthma_Blood_matg/data/"$GWAS_ID"_Asthma_new.txt --partition /home/software/hess/ldetect-data/ASN/fourier_ls-chr1.bed --out hess_result/"$GWAS_ID"/Asthma_new_"$GWAS_ID" --chrom 1


 #   nohup python /home/software/hess/hess.py --bfile /home/ref/ref/1000G_Phase3_EAS_plinkfiles/1000G.EAS.QC.12 --local-rhog /home/data1/Asthma/Asthma_Blood_matg/data/Asthma_new_"$GWAS_ID".txt /home/data1/Asthma/Asthma_Blood_matg/data/"$GWAS_ID"_Asthma_new.txt --partition /home/software/hess/ldetect-data/fourier_ls-chr12.bed --out hess_result/"$GWAS_ID"/Asthma_new_"$GWAS_ID" --chrom 12  & 

# GWAS_ID=GCST90002375

# for i in $(seq 1 22);
# do
#     python /home/software/hess/hess.py --bfile /home/ref/ref/1000G_Phase3_EAS_plinkfiles/1000G.EAS.QC."$i" --local-rhog /home/data1/Asthma/Asthma_Blood_matg/data2/Asthma_new_"$GWAS_ID".txt /home/data1/Asthma/Asthma_Blood_matg/data2/"$GWAS_ID"_Asthma_new.txt --partition /home/software/hess/ldetect-data/ASN/fourier_ls-chr"$i".bed --out hess_result/"$GWAS_ID"/Asthma_new_"$GWAS_ID" --chrom "$i"  
# done 
