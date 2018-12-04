library(ncdf4)
library(chron)
library(lattice)
library(RColorBrewer)




ncin <- nc_open("Pr_CORDEX/EUROPE/pr_EUR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_day_20060102-20101231.nc")
csvname <- "pr_EUR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_day_20060102-20101231.txt"
csvpath <- "/projects/dep_koornneef/grp_pecinka/Users/nawaz/Pranav_DATA/Pr_CORDEX/EUROPE"
x <- c("lat","lon",(as.character(seq(as.Date("2006/1/2"), as.Date("2010/12/31"), "days"))))


dname <- "pr"
lat <- as.matrix(as.vector(ncvar_get(ncin,"lat")))
lon <- as.matrix(as.vector((ncvar_get(ncin,"lon"))))
rlat <- as.matrix(as.vector(ncvar_get(ncin,"rlat")))
rlon <- as.matrix(as.vector(ncvar_get(ncin,"rlon")))

rlon<-rep(rlon,times=103)
rlat<-rep(rlat,times=106)
rlon <- as.matrix(rlon)
rlat <- as.matrix(rlat)

#lat_geo <- asin(cos(rlat)*sin(lat) - cos(lon)*sin(rlat)*cos(lat))
#lon_geo = atan2(sin(lon), tan(lat)*sin(rlat) + cos(lon)*cos(rlat)) - rlon
#y=matrix(lon_geo,106,103)
#y <- t(y)
#lon_geo <- as.matrix(as.vector(y))

tmp_array <- ncvar_get(ncin,dname)
time <- ncvar_get(ncin,"time")
nt <- dim(time)
m <- 1
tmp_slice <- tmp_array[,,m]

#lonlat <- as.matrix(expand.grid(lon,lat))
tmp_vec <- as.vector(tmp_slice)





####
from 1Apr to 31July
cut -f 1,2,93-214,458-579,824-945,1189-1310,1554-1675


awk '$1==-6.6&&$2==33.88{print}' pr_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_day_20060101-20101231.txt | cut -f 1,2,93-214,458-579,824-945,1189-1310,1554-1675 > Rabat_AFR_Pr_2006-2035.txt
awk '$1==-6.6&&$2==33.88{print}' pr_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_day_20110101-20151231.txt | cut -f 1,2,93-214,458-579,824-945,1189-1310,1554-1675 >> Rabat_AFR_Pr_2006-2035.txt
awk '$1==-6.6&&$2==33.88{print}' pr_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_day_20160101-20201231.txt | cut -f 1,2,93-214,458-579,824-945,1189-1310,1554-1675 >> Rabat_AFR_Pr_2006-2035.txt
awk '$1==-6.6&&$2==33.88{print}' pr_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_day_20210101-20251231.txt | cut -f 1,2,93-214,458-579,824-945,1189-1310,1554-1675 >> Rabat_AFR_Pr_2006-2035.txt
awk '$1==-6.6&&$2==33.88{print}' pr_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_day_20260101-20301231.txt | cut -f 1,2,93-214,458-579,824-945,1189-1310,1554-1675 >> Rabat_AFR_Pr_2006-2035.txt
awk '$1==-6.6&&$2==33.88{print}' pr_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_day_20310101-20351231.txt | cut -f 1,2,93-214,458-579,824-945,1189-1310,1554-1675 >> Rabat_AFR_Pr_2006-2035.txt

tmp_df01 <- data.frame(cbind(lat,lon,tmp_vec))
names(tmp_df01) <- c("lat","lon",paste(dname,as.character(m), sep="_"))



csvfile <- paste(csvpath, csvname, sep="")

tmp_vec_long <- as.vector(tmp_array)
tmp_mat <- matrix(tmp_vec_long, nrow=dim(lat), ncol=nt)
#latlon <- as.matrix(expand.grid(lat,lon))
tmp_df02 <- data.frame(cbind(lat,lon,tmp_mat))
names(tmp_df02) <- c(x)
write.table(na.omit(tmp_df02),csvname, row.names=FALSE, sep="\t")
