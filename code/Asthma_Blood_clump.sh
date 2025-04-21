#/bin/bash
nohup plink1.9 --bfile /home/ref/ref/1000G_EAS_ref/Merged_ExcludeDup_ID_Point --clump /home/data1/Asthma/Asthma_Blood_matg/result/Asthma_new_GCST90002299_trait1.txt --clump-field mtag_pval --clump-snp-field SNP  --clump-p1 5e-8   --clump-kb 250 --clump-r2 0.1 --out /home/data1/Asthma/Asthma_Blood_matg/clump/Asthma_new_Blood_clump &
plink1.9 --bfile /home/ref/ref/1000G_EAS_ref/Merged_ExcludeDup_ID_Point \
    --clump /home/data1/Asthma/Asthma_eas/Asthma_eas.sum \
    --clump-field pval \
    --clump-snp-field avsnp150 \
    --clump-p1 5e-8   \
    --clump-kb 500 \
    --clump-r2 0.1 \
    --out /home/data1/Asthma/Asthma_Blood_matg/clump/Asthma_clump_kb500

#plink1.9 --bfile /home/ref/ref/1000G_EAS_ref/Merged_ExcludeDup_ID_Point --clump ${MTAG_trait1} --clump-field mtag_pval --clump-snp-field SNP --clump-p1 5e-8   --clump-kb 250 --clump-r2 0.1 --out /home/songyingchao/SCZ_OtherPheno_Gender/PsyRelatedPheno_MTAG/SigSummary/Female_clump_${PSY}_${IDP}

plink1.9 --bfile /home/ref/ref/1000G_EAS_ref/Merged_ExcludeDup_ID_Point --clump ${MTAG_trait1} --clump-field mtag_pval --clump-snp-field SNP --clump-p1 5e-8   --clump-kb 250 --clump-r2 0.1 --out /home/songyingchao/SCZ_OtherPheno_Gender/PsyRelatedPheno_MTAG/SigSummary/Female_clump_${PSY}_${IDP}


plink1.9 --bfile /home/ref/ref/1000G_EAS_ref/Merged_ExcludeDup_ID_Point --clump /home/data1/Asthma/Asthma_Blood_matg/result/Asthma_new_format2_GCST90002299_0508_trait1.txt --clump-field mtag_pval --clump-snp-field SNP --clump-p1 5e-8   --clump-kb 250 --clump-r2 0.1 --out /home/data1/Asthma/Asthma_Blood_matg/clump/Asthma_new_format2_GCST90002299_0508

plink1.9 --bfile /home/ref/ref/1000G_EAS_ref/Merged_ExcludeDup_ID_Point --clump /home/data1/Asthma/Asthma_Blood_matg/result/Asthma_new_format2_GCST90002299_0508_trait1.txt --clump-field mtag_pval --clump-snp-field SNP --clump-p1 5e-8   --clump-kb 500 --clump-r2 0.1 --out /home/data1/Asthma/Asthma_Blood_matg/clump/Asthma_new_format2_GCST90002299_0508_500kb


plink1.9 --bfile /home/ref/ref/1000G_EAS_ref/Merged_ExcludeDup_ID_Point \
    --clump /home/data1/Asthma/newres_pc2.glm.logistic \
    --clump-field P \
    --clump-snp-field ID \
    --clump-p1 1   \
    --clump-kb 500 \
    --clump-r2 0.1 \
    --out /home/data1/Asthma/newres_pc2.glm.logistic

plink1.9 --bfile /home/ref/ref/1000G_EAS_ref/Merged_ExcludeDup_ID_Point \
    --clump /home/data1/Asthma/res_pc2.glm.logistic \
    --clump-field P \
    --clump-snp-field ID \
    --clump-p1 1   \
    --clump-kb 500 \
    --clump-r2 0.1 \
    --out /home/data1/Asthma/res_pc2.glm.logistic

plink1.9 --bfile /home/ref/ref/1000G_EAS_ref/Merged_ExcludeDup_ID_Point \
    --clump /home/data1/Asthma/Asthma_Blood_matg/result/Asthma_new_GCST90002299_trait_1.txt \
    --clump-field mtag_pval \
    --clump-snp-field SNP \
    --clump-p1 1   \
    --clump-kb 500 \
    --clump-r2 0.1 \
    --out /home/data1/Asthma/Asthma_new_GCST90002299_trait_1

