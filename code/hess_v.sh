#!/bin/bash/
GWAS_ID=GCST90002293

GWAS_Name=Baso

python /home/software/hess/hess.py --prefix hess_result/"$GWAS_ID"/Asthma_new_"$GWAS_ID"_trait1 --out hess_result/"$GWAS_ID"_v/Asthma_new_"$GWAS_ID"_trait1_step2

python /home/software/hess/hess.py --prefix hess_result/"$GWAS_ID"/Asthma_new_"$GWAS_ID"_trait2 --out hess_result/"$GWAS_ID"_v/Asthma_new_"$GWAS_ID"_trait2_step2

python /home/software/hess/hess.py --prefix hess_result/"$GWAS_ID"/Asthma_new_"$GWAS_ID" --local-hsqg-est hess_result/"$GWAS_ID"_v/Asthma_new_"$GWAS_ID"_trait1_step2.txt hess_result/"$GWAS_ID"_v/Asthma_new_"$GWAS_ID"_trait2_step2.txt  --num-shared 0 --pheno-cor 0.0  --out hess_result/"$GWAS_ID"_v/Asthma_new_"$GWAS_ID"_step3

python /home/software/hess/misc/local_hsqg_manhattan.py --local-hsqg-est  hess_result/"$GWAS_ID"_v/Asthma_new_"$GWAS_ID"_trait1_step2.txt --out  hess_result/"$GWAS_ID"_v/Asthma_new_"$GWAS_Name"_trait1_local_hsqg.pdf --trait-name Asthma

python /home/software/hess/misc/local_hsqg_manhattan.py --local-hsqg-est  hess_result/"$GWAS_ID"_v/Asthma_new_"$GWAS_ID"_trait2_step2.txt --out  hess_result/"$GWAS_ID"_v/Asthma_new_"$GWAS_Name"_trait2_local_hsqg.pdf --trait-name "$GWAS_Name"

python /home/software/hess/misc/local_rhog_manhattan.py  --local-rhog-est hess_result/"$GWAS_ID"_v/Asthma_new_"$GWAS_ID"_step3.txt --local-hsqg-est hess_result/"$GWAS_ID"_v/Asthma_new_"$GWAS_ID"_trait1_step2.txt hess_result/"$GWAS_ID"_v/Asthma_new_"$GWAS_ID"_trait2_step2.txt --out  hess_result/"$GWAS_ID"_v/Asthma_new_"$GWAS_Name".pdf  --trait-names Asthma "$GWAS_Name"

