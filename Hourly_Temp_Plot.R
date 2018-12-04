data <- as.vector(read.table("2020_Eur_15May-15Aug.txt",header = FALSE))
dim(data)
data <- data$V1
data <- matrix(data,nrow = 24,ncol = 122)

library(gplots)
require("RColorBrewer")

my_palette <- colorRampPalette(c("dodgerblue", "gold1", "firebrick1"))(n = 299)
col_breaks = c(seq(09,15,length=100), seq(16,25,length=100), seq(26,30,length=100))
heatmap.2(data,trace = 'none',density.info = 'none',dendrogram = 'none',Rowv = 'NA',Colv = 'NA',col = my_palette,breaks = col_breaks)
