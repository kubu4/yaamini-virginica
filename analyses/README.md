# `analyses` Subdirectory Structure

This subdirectory hosts the output of all analyses regarding *C. virginica* epigenetic response to ocean acidification. Every folder houses all necessary files for a discrete analysis step in a larger pipeline. Folders follow this naming convention:

**Year-Month-Date-AnalysisStep** *(ex. 2018-10-25-MethylKit)*

The following pipelines are represented in this subdirectory:

**[2018-10-25-MethylKit](https://github.com/fish546-2018/yaamini-virginica/blob/master/analyses/2018-10-25-MethylKit)**:

- [R Markdown Script](https://github.com/fish546-2018/yaamini-virginica/blob/master/analyses/2018-10-25-MethylKit/2018-10-25-MethylKit.Rmd) for identifying DMLs and DMRs
- [2018-10-25-Loci-Analysis](https://github.com/fish546-2018/yaamini-virginica/blob/master/analyses/2018-10-25-MethylKit/2018-10-25-Loci-Analysis): Subdirectory with dendograms, PCAs, and plots depicting CpG coverage and methylation for each sample produced when identifying DMLs
- [2018-10-25-Tiling-Analysis](https://github.com/fish546-2018/yaamini-virginica/blob/master/analyses/2018-10-25-MethylKit/2018-10-25-Tiling-Analysis): Subdirectory with dendograms and PCAs from tiling window analysis to identify DMRs
