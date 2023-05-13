# rNBI  <img src="./inst/logo/rNBI_Training.png" align="right" width="150" />

> This package contains the lectures and exercises used in the course **Spatial data analysis with R - NBI**:

- 1.  Introduction to R - Part 1

- 2.  Introduction to R - Part 2

- 3.  Raster files and spatial data

- 4.  Data processing

- 5.  Spatial and temporal statistics

- 6.  Automating downloading

- 7.  Functions and parallel computation

- 8.  Advanced spatial and temporal statistics


### Installation and usage

Make sure that devtools are installed:
```r
install.packages("remotes")
```
Install the rNBI package from GitHub :
```r
remotes::install_github("obaezvil/rNBI")
```
Load the package:
```r
library(rNBI)
```
Open the first lecture:
```r
render_lectures("Lecture1") 
```

In case that the download failed with the following error: *Error in utils::download.file*, you can try to increase the timeout for the downloads as follows and try again.
```r
options(timeout=500) 
remotes::install_github("obaezvil/rNBI")
```

The link to the data is as follows:
[https://th-koeln.sciebo.de/s/67HCqQCdH907Wgp](https://th-koeln.sciebo.de/s/67HCqQCdH907Wgp)