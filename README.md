LITAP
================

**Landscape Integrated Terrain Analysis Package (LITAP)** for the analysis of waterflow based on elevation data and pit removals. Based on R. A. (Bob) MacMillan's FlowMapR program.

See the companion website for more details: <http://steffilazerte.github.io/LITAP>

Installation
------------

Use the `devtools` package to directly install R packages from github:

``` r
install.packages("devtools")  # If not already installed
devtools::install_github("steffilazerte/LITAP")
```

Basic Usage
-----------

Must specify the dem file and the number of rows and columns:

``` r
complete_run(file = "testElev.dem", nrow = 100, ncol = 100)
```

Can also specify pit removal parameters:

``` r
complete_run(file = "testElev.dem", nrow = 100, ncol = 100, max_area = 5, max_depth = 0.2)
```

As well as the location of output files:

``` r
complete_run(file = "testElev.dem", nrow = 100, ncol = 100, folder_out = "./Output/")
```

LITAP accepts multiple file types (see `?load_file` for details and requirements):

``` r
complete_run(file = "testElev.csv")
complete_run(file = "testElev.grd")
complete_run(file = "testElev.flt")
```

Output
------

Output files include .rds (R data files) and .csv files in the "Final" folder, .dbf files in the "dbf" folder and backup files (for resuming runs) in the "Backup" folder. Additionally, an html report summaring the run is included in the output folder

See the [LITAP website](http://steffilazerte.github.io/LITAP/) hosted on github for more details and examples
