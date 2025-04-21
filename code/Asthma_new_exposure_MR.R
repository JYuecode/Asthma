library(TwoSampleMR)
library(ieugwasr)
library(plinkbinr)
library("dplyr")
rmarkdown::find_pandoc(dir = "/home/software/pandoc-2.14.0.3/bin")
# EAS_Asthma_dat <- read_exposure_data(
#     filename = "/home/data1/Asthma/Asthma_Blood_matg/data/Asthma_GCST90002299.txt",
#     sep = "\t",
#     snp_col = "snpid",
#     beta_col = "beta",
#     se_col = "se",
#     effect_allele_col = "a1",
#     other_allele_col = "a2",
#     eaf_col = "freq",
#     pval_col = "pval",
#   #  units_col = "Units",
#   #  gene_col = "Gene",
#     samplesize_col = "n"
# )
# EAS_Asthma_dat_clump <- ld_clump(  dplyr::tibble(rsid=EAS_Asthma_dat$SNP,
#     pval=EAS_Asthma_dat$pval.exposure,
#     id=EAS_Asthma_dat$id.exposure, 
#     beta_col = EAS_Asthma_dat$beta.exposure,
#     se_col = EAS_Asthma_dat$se.exposure, 
#     eaf_col = EAS_Asthma_dat$eaf.exposure),clump_r2=0.01,
#     plink_bin = "plink1.9",
# #欧洲人群参考基因组位置  
#     bfile = "/home/ref/ref/1000G_EAS_ref/Merged_ExcludeDup_ID_Point")
# colnames(EAS_Asthma_dat_clump )=c("SNP","pval.exposure","id.exposure","beta.exposure","se.exposure","eaf.exposure")
# EAS_Asthma_dat_clump<-inner_join(EAS_Asthma_dat_clump, EAS_Asthma_dat, by = c("SNP","pval.exposure","id.exposure","beta.exposure","se.exposure","eaf.exposure"))  

files_outcome <- list.files("/home/data1/Asthma/Asthma_Blood_matg/data2/",pattern = "\\_Asthma_new.txt$", full.names = TRUE)
df_list<-list()

# 使用lapply读取所有文件并存储到命名DataFrame列表中
df_list <- setNames(
  lapply(files_outcome, function(file){
    # 使用你的读取数据的代码，比如 read.table, read.csv, readr::read_csv 等
    # 这里使用 read.csv 作为示例，你可以根据实际情况选择适当的读取函数
EAS_Asthma_dat <- read_exposure_data(
    filename = paste("/home/data1/Asthma/Asthma_Blood_matg/data2/","Asthma_new_",gsub("_Asthma_new.txt","",basename(file)),".txt",sep=""),
    sep = "\t",
    snp_col = "SNP",
    beta_col = "beta",
    se_col = "se",
    effect_allele_col = "A2",
    other_allele_col = "A1",
    eaf_col = "freq",
    pval_col = "pval",
  #  units_col = "Units",
  #  gene_col = "Gene",
    samplesize_col = "N"
)
EAS_Asthma_dat_clump <- ld_clump(  dplyr::tibble(rsid=EAS_Asthma_dat$SNP,
    pval=EAS_Asthma_dat$pval.exposure,
    id=EAS_Asthma_dat$id.exposure, 
    beta_col = EAS_Asthma_dat$beta.exposure,
    se_col = EAS_Asthma_dat$se.exposure, 
    eaf_col = EAS_Asthma_dat$eaf.exposure),clump_kb = 10000,
    clump_r2 = 0.1,
    clump_p = 5e-8,
    plink_bin = "plink1.9",pop="EAS",
#欧洲人群参考基因组位置  
    bfile = "/home/ref/ref/1000G_EAS_ref/Merged_ExcludeDup_ID_Point")
colnames(EAS_Asthma_dat_clump )=c("SNP","pval.exposure","id.exposure","beta.exposure","se.exposure","eaf.exposure")
EAS_Asthma_dat_clump<-inner_join(EAS_Asthma_dat_clump, EAS_Asthma_dat, by = c("SNP","pval.exposure","id.exposure","beta.exposure","se.exposure","eaf.exposure"))  
EAS_Asthma_dat_clump$exposure="EAS_Asthma_new"
    outcome_dat<-read_outcome_data(
      filename = file,
      sep = "\t",
      snp_col = "SNP",
      beta_col = "beta",
      se_col = "se",
      effect_allele_col = "A2",
      other_allele_col = "A1",
      eaf_col = "freq",
      pval_col = "pval",
      #  units_col = "Units",
      #  gene_col = "Gene",
      samplesize_col = "N")
#     file_clump<-outcome_dat
#     file_clump<-ld_clump(  dplyr::tibble(rsid=file_clump$SNP,
#     pval=file_clump$pval.outcome,
#     id=file_clump$id.outcome, 
#     beta_col = file_clump$beta.outcome,
#     se_col = file_clump$se.outcome, 
#     eaf_col = file_clump$eaf.outcome),clump_kb = 10000,
#     clump_r2 = 0.1,
#     clump_p = 0.001,
#     plink_bin = "plink1.9",pop="EAS",
# #亚洲人群参考基因组位置  
#     bfile = "/home/ref/ref/1000G_EAS_ref/Merged_ExcludeDup_ID_Point")

#     colnames(file_clump)=c("SNP","pval.outcome","id.outcome","beta.outcome","se.outcome","eaf.outcome")
#     file_clump<-inner_join(outcome_dat, file_clump, by = c("SNP","pval.outcome","id.outcome","beta.outcome","se.outcome","eaf.outcome"))
#     file_clump$outcome=basename(file)
    outcome_dat$outcome=basename(file)
    harmonise_file<-harmonise_data(
    outcome_dat = outcome_dat, 
    exposure_dat = EAS_Asthma_dat_clump
    )
    mr_result<-generate_odds_ratios(mr(harmonise_file))
    mr_presso_result<-run_mr_presso(harmonise_file, NbDistribution = 10000)
    mr_presso_test<-mr_presso_result[[1]]$`MR-PRESSO results`$`Distortion Test`$`Outliers Indices`
    directionality1<-directionality_test(harmonise_file)
    directionality2<-directionality_test(harmonise_file[-mr_presso_test,])
    heterogeneity1<-mr_heterogeneity(harmonise_file)
    heterogeneity2<-mr_heterogeneity(harmonise_file[-mr_presso_test,])
    pleiotropy1<-mr_pleiotropy_test(harmonise_file)
    pleiotropy2<-mr_pleiotropy_test(harmonise_file[-mr_presso_test,])
    leaveoneout1<-mr_leaveoneout(harmonise_file)
    leaveoneout2<-mr_leaveoneout(harmonise_file[-mr_presso_test,])

    print(mr_result)
    save(harmonise_file,mr_presso_result,mr_presso_test,heterogeneity1,pleiotropy1,heterogeneity2,pleiotropy1,
    pleiotropy2,leaveoneout1,leaveoneout2,mr_result,directionality1,directionality2,
     file = paste("/home/data1/Asthma/Asthma_MR/EAS_Asthma_new.exposure_result/p_",basename(file),".RData",sep=""))
    write.csv(mr_result, file = paste("/home/data1/Asthma/Asthma_MR/EAS_Asthma_new.exposure_result/p_",basename(file),sep=""),row.names=F)
  #   mr_report(
  # harmonise_file,
  # output_path = "/home/data1/Asthma/Asthma_MR/EAS_Asthma_new.exposure_result",
  # output_type = "pdf")
    return(mr_result)
  }), 
  basename(files_outcome)
)
save(df_list,
     file = "/home/data1/Asthma/Asthma_MR/EAS_Asthma_new.exposure_result/MR_result_list_p.RData")

