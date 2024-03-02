#load necessary libraries
library(dplyr)
library(readxl)
library(anytime)
library(data.table)
library(ggplot2)
library(ggrepel)
library(fs)
library(tidyverse)


#load the files for variant data
# variant_filepath <- readline("Enter the path to the folder containing the variant files: ")
# files<- fs::dir_ls(variant_filepath)
# length(files)


#load the files for distinctiveness data
distinctiveness_filepath <- readline("Enter the path to the folder containing the distinctiveness files: ")
files<- fs::dir_ls(distinctiveness_filepath)
length(files)
files[1]
#merge the files into a single dataframe
distinct_list <- list()
for (i in 1:length(files)){
  distinct_list[[i]] <- read_excel(files[i])
}

combined_new <- do.call (rbind, distinct_list)
#combined_new <- rbind(distinct_list)
length(combined_new)


merged_new <- merge(combined_new, combined_df_list, by = "Sequence_ID")
length(merged_new)
merged_df <- rbind(merged_df, merged_new)
