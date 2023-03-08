#withr::with_libpaths('~/packages/', remotes::install_github('https://github.com/r-spatial/leafem.git', force = TRUE))



#cp /dbfs/FileStore/jamesduffy/cog_test/baseline__LUF_Core_Baseline.tif /tmp/
# change res
#gdalwarp /tmp/baseline__LUF_Core_Baseline.tif /tmp/baseline__LUF_Core_Baseline_50m.tif -tr 50 50 -r near -of COG -co COMPRESS=LZW -overwrite -dstnodata 0
# reproject and sort NAs
#gdalwarp /tmp/baseline__LUF_Core_Baseline_50m.tif /tmp/baseline__LUF_Core_Baseline_50m_NAmod.tif -r near -t_srs EPSG:4326 -of COG -co COMPRESS=LZW -overwrite -dstnodata 0
#cp /tmp/baseline__LUF_Core_Baseline_50m_NAmod.tif /dbfs/FileStore/jamesduffy/cog_test/