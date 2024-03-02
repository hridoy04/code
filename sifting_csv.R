library(fs)
library(tidyverse)
library(dplyr)
library(tools)

path<-"~/Documents/Thesis/variant_excels/csv_variant_countries/"
file<- fs::dir_ls(path, regexp = "\\.csv$")
length(file)

file_list <- list()
for (i in 1:length(file)){
  file_list[[i]] <- read_csv(file[i], show_col_types = FALSE)
}
length(file_list)

base_name<- basename(file_path_sans_ext(file))

file_list <- setNames(file_list,base_name)
file_list[1]


hi <- function (df){
  
  df$Date <- as.Date(df$Date)
  
  # Arrange the data by Lineage and Date
  arranged_data <- df %>%
    arrange(Lineage, Date)
  
  # Group the data by Lineage and select the first row for each group
  filtered_data <- arranged_data %>%
    group_by(Lineage) %>%
    slice_head(n = 1) %>%
    ungroup()
  
  return (filtered_data)
}

csv="~/CSV/"

for (i in 1:length(file_list)){
  # if (nrow(file_list[[i]])<3){
  #   print(base_name[i])  
  # }
  write.csv(hi(file_list[[i]]), paste0(csv,base_name[i],".csv"), row.names = FALSE)
}
