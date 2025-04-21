#!/bin/bash

python /home/software/mtag/mtag.py \
--stream_stdout --snp_name SNP --z_name Z \
--n_min 0.0 \
--ld_ref_panel /home/software/ldsc/eas_ldscores/ \
--sumstats /home/data1/Asthma/Asthma_Blood_matg/data/Asthma_GCST90002299.txt,/home/data1/Asthma/Asthma_Blood_matg/data/GCST90002299_Asthma.txt \
--out /home/data1/Asthma/Asthma_Blood_matg/result/Asthma_GCST90002299 \
--force

python /home/software/mtag/mtag.py \
--stream_stdout --snp_name avsnp150 --z_name z \
--n_min 0.0 \
--ld_ref_panel /home/software/ldsc/eas_ldscores/ \
--sumstats /home/data1/Asthma/Asthma_eas/Asthma_eas.sum,/home/data1/Asthma/eas_Blood/Blood_sum/GCST90002299.sum \
--out /home/data1/Asthma/Asthma_Blood_matg/result_no/Asthma_GCST90002299 \
--force


nohup python /home/software/mtag/mtag.py \
--stream_stdout --snp_name SNP --z_name Z \
--n_min 0.0 \
--ld_ref_panel /home/software/ldsc/eas_ldscores/ \
--sumstats /home/data1/Asthma/Asthma_Blood_matg/data/Asthma_new_GCST90002299.txt,/home/data1/Asthma/Asthma_Blood_matg/data/GCST90002299_Asthma_new.txt \
--out /home/data1/Asthma/Asthma_Blood_matg/result/Asthma_new_GCST90002299 \
--force &


python /home/software/mtag/mtag.py \
--stream_stdout --snp_name avsnp150 --z_name z \
--n_min 0.0 \
--ld_ref_panel /home/software/ldsc/eas_ldscores/ \
--sumstats /home/data1/Asthma/Asthma_eas/Asthma_new_eas_format.sum,/home/data1/Asthma/eas_Blood/Blood_sum/GCST90002299.sum \
--out /home/data1/Asthma/Asthma_Blood_matg/result/Asthma_new_format_GCST90002299 \
--force

python /home/software/mtag/mtag.py \
--stream_stdout --snp_name SNP --z_name Z \
--n_min 0.0 \
--ld_ref_panel /home/software/ldsc/eas_ldscores/ \
--sumstats /home/data1/Asthma/Asthma_Blood_matg/data2/Asthma_new_format_GCST90002299.txt,/home/data1/Asthma/Asthma_Blood_matg/data2/GCST90002299_Asthma_new_format.txt \
--out /home/data1/Asthma/Asthma_Blood_matg/result/Asthma_new_format_GCST90002299_0508 \
--force

python /home/software/mtag/mtag.py \
--stream_stdout --snp_name SNP --z_name Z \
--n_min 0.0 \
--ld_ref_panel /home/software/ldsc/eas_ldscores/ \
--sumstats /home/data1/Asthma/Asthma_Blood_matg/data2/Asthma_new_format2_GCST90002299.txt,/home/data1/Asthma/Asthma_Blood_matg/data2/GCST90002299_Asthma_new_format2.txt \
--out /home/data1/Asthma/Asthma_Blood_matg/result/Asthma_new_format2_GCST90002299_0508 \
--force