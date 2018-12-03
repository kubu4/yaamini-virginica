# Influence of ocean acidification on Eastern oyster (*Crassostrea virginica*) reproductive tissue

## Background

Epigenetic modification, specifically DNA methylation, is one possible mechanism for transgenerational plasticity. Before inheritance of methylation patterns can be characterized we need a better understanding of how environmental change modifies the parental epigenome. Specifically, methylation patterns should be understood in reproductive tissue. Collaboarting with Dr. Kathleen Lotterhos' lab at Northeastern University, we examined the effect of ocean acidification on Eastern oyster (*Crassostrea virginica*) reproductive tissue.

The Lotterhos lab exposed twelve oysters to two different pCO<sub>2</sub> for four weeks at 15ºC during the summer of 2017. Half of the oysters were exposed to 400 µatm (control), and the other half to 2800 µatm. The Lotterhos lab sent gonad samples for MBDSeq to identify if different pCO<sub>2</sub> conditions drive differential methylation patterns. I prepared samples for bisulfite sequencing. Information about sample preparation and tangential analyses can be found in [the broader project repository](https://github.com/RobertsLab/project-virginica-oa).

## Question

Does acute exposure to elevated pCO<sub>2</sub> conditions induce differential methylation in *Crassostrea virginica* reproductive tissue?

## Objectives

My goal is to identify differentially methylated regions and loci between oysters exposed to ambient and elevated pCO<sub>2</sub> conditions.

## Methods 

### Overview

1. Receive sequencing data and trim files as appropriate
2. Align trimmed files to a reference bisulfite genome in `bismark`
3. Isolate differentially methylated loci (DML) and regions (DMR) from alignments in `methylKit`
4. Characterize DML and DMR with `bedtools`

### Project Timeline

**Week 4**: 
- Start `bismark` alignment on Mox: Protocol can be found [here](https://yaaminiv.github.io/DML-Analysis-Part12/)
- Use different samples to create working `methylKit` protocol. This work was done in a [different Github repository](https://github.com/RobertsLab/project-virginica-oa).
  - Validate analysis parameters in `methylKit` with other samples: Results can be found [here](https://yaaminiv.github.io/DML-Analysis-Part13/)
  - Create protocol for tiling analysis in `methylKit`: Results can be found [here](https://yaaminiv.github.io/DML-Analysis-Part14/)

**Week 5**:

- Added [R Markdown file for `methylKit` analysis](https://github.com/fish546-2018/yaamini-virginica/blob/master/notebooks/2018-11-01-DML-and-DMR-Analysis.ipynb)
- Added [Jupyter notebook for DML and DMR characterization](https://github.com/fish546-2018/yaamini-virginica/blob/master/notebooks/2018-11-01-DML-and-DMR-Analysis.ipynb) 

**Week 6**: 
- Ran `methylKit` to identify DML and DMR on samples from Mox with [this R Markdown script](https://github.com/fish546-2018/yaamini-virginica/blob/master/notebooks/2018-11-01-DML-and-DMR-Analysis.ipynb)
- Characterized locations of DML and DMR in [this Jupyter notebook](https://github.com/fish546-2018/yaamini-virginica/blob/master/notebooks/2018-11-01-DML-and-DMR-Analysis.ipynb)

**Week 7**:
- Completed transposable elements analysis in [this Jupyter notebook](https://github.com/fish546-2018/yaamini-virginica/blob/master/notebooks/2018-11-01-DML-and-DMR-Analysis.ipynb). Results can be found [here](https://yaaminiv.github.io/DML-Analysis-Part17/).
- Conducted flanking analysis with `bedtools flank` and `bedtools closest` in [this Jupyter notebook](https://github.com/fish546-2018/yaamini-virginica/blob/master/notebooks/2018-11-01-DML-and-DMR-Analysis.ipynb). Results can be found [here](https://yaaminiv.github.io/DML-Analysis-Part18/)

**Week 9**:
- Visualize data and complete all remaining analyses

## Results

### Analysis parameter validation

*A full descriiption of `methylKit` parameter validation can be found [here](https://yaaminiv.github.io/DML-Analysis-Part13/), with a focus on `methylKit` tiling analysis [here](https://yaaminiv.github.io/DML-Analysis-Part14/).*

#### `bismark`

**Table 1**.  Mapping efficiency (%) for Bismark v.19.0 and Bowtie 2-2.3.4 (Linux x84_64 version) alignment of trimmed sample sequences to the *C. virginica* bisulfite genome. Mapping efficiency (%) based on different `-score_min` settings. For final analyses, an alignment score function of f(x) = 0 - 1.2x, where x is the read length, was set using `-score_min L,0,-1.2` to set define alignment stringency and optimize mapping efficiency for all samples.

| **Treatment** | **Sample** | **L,0,-0.6** | **L,0,-0.9** | **L,0,-1.2** |
|:-------------:|:----------:|:------------:|:------------:|:------------:|
|    Control    |      1     |     15.5     |     20.2     |     28.8     |
|    Control    |      2     |     32.4     |     40.2     |     49.8     |
|    Control    |      3     |     37.2     |     45.3     |     53.6     |
|    Control    |      4     |     36.0     |     44.7     |     52.9     |
|    Control    |      5     |     34.6     |     42.9     |     51.7     |
|     High      |      6     |     36.7     |     45.0     |     53.8     |
|     High      |      7     |     34.6     |     42.9     |     51.4     |
|     High      |      8     |     31.7     |     39.0     |     47.6     |
|     High      |      9     |     33.0     |     41.2     |     49.9     |
|     High      |     10     |     36.6     |     44.9     |     53.0     |

**Figure 1**. Mapping efficiency (%) for Bismark v.19.0 and Bowtie 2-2.3.4 (Linux x84_64 version) alignment of trimmed sample sequences to the *C. virginica* bisulfite genome.

#### `methylKit`

**DML**:

**Table 2**. The `mincov` metric, total number of loci produced, and the number of DMLs that were at least 50% different between treatment andc control samples. More restrictive `mincov` metrics produced less significantly different DMLs. `mincov = 3` was used in final analysis.

| **`mincov`** | **Total Loci** | **Number of Significantly Different DMLs** |
|:------------:|:--------------:|:------------------------------------------:|
|       1      |     1112085    |                    4904                    |
|       3      |     670301     |                    1398                    |
|       5      |     503780     |                     816                    |

![cluster-mincov3](https://raw.githubusercontent.com/RobertsLab/project-virginica-oa/master/analyses/2018-10-11-MethylKit-Parameter-Testing/2018-10-18-Genefish-Samples/2018-10-18-Full-Sample-CpG-Methylation-Clustering-Cov3.jpeg)

**Figure 2**. Dendogram for clustering of full sample methylation using `mincov = 3` for DML.

![pca-mincov3](https://raw.githubusercontent.com/RobertsLab/project-virginica-oa/master/analyses/2018-10-11-MethylKit-Parameter-Testing/2018-10-18-Genefish-Samples/2018-10-18-Full-Sample-Methylation-PCA-Cov3.jpeg)

**Figure 3**. Principal Components Analysis of full sample methylation using `mincov = 3` for DML.

- [Coverage plots for each sample generated with `mincov = 3`](https://github.com/fish546-2018/yaamini-virginica/tree/master/analyses/2018-10-25-MethylKit/2018-10-25-Loci-Analysis).
- [BEDfile of DML identified](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-10-25-MethylKit/2018-11-07-DML-Locations.bed)

**DMR**:

**Table 3**. Window size, step size, total number of regions produced, and the number of DMLs that were at least 50% different between treatment and control samples. The number of regions and siginificantly different DMRs seem to be dictated by the window size, and not the step size.

| **Window Size (bp)** | **Step Size (bp)** | **Total Regions** | **Number of Significantly Different DMRs** |
|:--------------------:|:------------------:|:-----------------:|:------------------------------------------:|
|          100         |         100        |       217538      |                     162                    |
|         1000         |        1000        |       104144      |                     118                    |
|         1000         |         100        |       104144      |                     118                    |


![cluster-tiles100](https://raw.githubusercontent.com/RobertsLab/project-virginica-oa/master/analyses/2018-10-11-MethylKit-Parameter-Testing/2018-10-19-Tiling-Analysis/2018-10-19-Full-Sample-CpG-Methylation-Clustering-Tiles100.jpeg)

**Figure 4**. Dendogram for clustering of full sample methylation using `mincov = 3` and 100 bp window and step sizes for DMR.

![pca-tiles100](https://raw.githubusercontent.com/RobertsLab/project-virginica-oa/master/analyses/2018-10-11-MethylKit-Parameter-Testing/2018-10-19-Tiling-Analysis/2018-10-19-Full-Sample-Methylation-PCA-Tiles100.jpeg)

**Figure 5**. Principal Components Analysis of full sample methylation using `mincov = 3` and 100 bp window and step sizes for DMR.

- [BEDfile of DMR identified](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-10-25-MethylKit/2018-11-07-DMR-Locations.bed)

### DML and DMR location characterization

*A full description can be found [here](https://yaaminiv.github.io/DML-Analysis-Part17/).*

**DML**:

- [DML-exon overlaps](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-11-01-DML-and-DMR-Analysis/2018-11-07-DML-Exon.txt)
- [DML-intron ovleraps](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-11-01-DML-and-DMR-Analysis/2018-11-07-DML-Intron.txt)
- [DML-mRNA overlaps](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-11-01-DML-and-DMR-Analysis/2018-11-07-DML-mRNA.txt)
- [Unique genes in DML-mRNA overlaps](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-11-01-DML-and-DMR-Analysis/2018-11-07-Unique-Genes-in-DML-mRNA-Overlap.txt)
- [DML-TE overlaps](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-11-01-DML-and-DMR-Analysis/2018-11-07-DML-TE-Cg.txt)

**Table 4**. Location of differentially methylated loci (DML) in various genomic features from BEDtools intersect v2.26.0. Genome feature files were downloaded from NCBI. The *C. virginica* genome has 60,201 genes total. For each locus, hypermethylated refers to significantly higher methylation in treatment samples, while hypomethylated indicates significantly lower methylation. Transposable elements refers to those identified using *C. gigas* as the species designation.

|      **Genomic Feature**     |   **Result**  |
|:----------------------------:|:-------------:|
|           Total DML          |      1398     |
|      Hypomethylated DML      |      747      |
|      Hypermethylated DML     |      651      |
|     Total genes with DML     |     2,683     |
|  DML in mRNA coding regions  | 1263 (90.34%) |
|         DML in exons         |  786 (56.22%) |
|        DML in introns        |  498 (35.62%) |
| DML in transposable elements |   91 (6.51%)  |

**DMR**:

- [DMR-exon overlaps](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-11-01-DML-and-DMR-Analysis/2018-11-07-DMR-Exon.txt)
- [DMR-intron ovleraps](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-11-01-DML-and-DMR-Analysis/2018-11-07-DMR-Intron.txt)
- [DMR-mRNA overlaps](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-11-01-DML-and-DMR-Analysis/2018-11-07-DMR-mRNA.txt)
- [Unique genes in DMR-mRNA overlaps](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-11-01-DML-and-DMR-Analysis/2018-11-07-Unique-Genes-in-DMR-mRNA-Overlap.txt)
- [DMR-TE overlaps](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-11-01-DML-and-DMR-Analysis/2018-11-07-DMR-TE-Cg.txt)

**Table 5**. Location of differentially methylated regions (DMR) in various genomic features from BEDtools intersect v2.26.0. Regions were identified in a tiling window analysis in methylKit v.1.7.9 in R Genome feature files were downloaded from NCBI. The *C. virginica* genome has 60,201 genes total. For each 100 bp region, hypermethylated refers to significantly higher methylation in treatment samples, while hypomethylated indicates significantly lower methylation. Transposable elements refers to those identified using *C. gigas* as the species designation.

|      **Genomic Feature**     |  **Result**  |
|:----------------------------:|:------------:|
|           Total DMR          |      162     |
|      Hypomethylated DMR      |      23      |
|      Hypermethylated DMR     |      139     |
|     Total genes with DMR     |      305     |
|  DMR in mRNA coding regions  | 139 (85.80%) |
|         DMR in exons         |  64 (39.51%) |
|        DMR in introns        | 112 (69.14%) |
| DMR in transposable elements |  23 (14.20%) |

**Transposable elements**:

**Table 6**. Percent overlap between transposable element and exons, introns, and mRNA coding regions. Transposable elements refers to those identified using *C. gigas* as the species designation.

| **Genomic Feature** | **Overlap** |
|:-------------------:|:-----------:|
| mRNA Coding Regions |     7.79    |
|        Exons        |     6.00    |
|       Introns       |     14.2    |

### Flanking analysis

*A full description can be found [here](https://yaaminiv.github.io/DML-Analysis-Part18/).*

#### `bedtools flank`

[1000 bp flanks for mRNA coding regions](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-11-01-DML-and-DMR-Analysis/2018-11-14-Flanking-Analysis/2018-11-14-mRNA-1000bp-Flanks.bed)

**DML**:

- [DML-upstream flank overlaps](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-11-01-DML-and-DMR-Analysis/2018-11-14-Flanking-Analysis/2018-11-15-mRNA-100bp-UpstreamFlanks-DML.txt)
- [DML-downstream flank overlaps](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-11-01-DML-and-DMR-Analysis/2018-11-14-Flanking-Analysis/2018-11-15-mRNA-100bp-DownstreamFlanks-DML.txt)

**DMR**:

- [DMR-upstream flank overlaps](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-11-01-DML-and-DMR-Analysis/2018-11-14-Flanking-Analysis/2018-11-15-mRNA-100bp-DownstreamFlanks-DMR.txt)
- [DMR-downstream flank overlaps](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-11-01-DML-and-DMR-Analysis/2018-11-14-Flanking-Analysis/2018-11-15-mRNA-100bp-UpstreamFlanks-DMR.txt)

#### `bedtools closest`

**DML**:

[Closest non-overlapping DML to mRNA coding regions](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-11-01-DML-and-DMR-Analysis/2018-11-14-Flanking-Analysis/2018-11-14-mRNA-Closest-NoOverlap-DMLs.txt)

**Figure 6**. Distribution of closest non-overlapping DML to mRNA coding regions with 100 bp of the coding region.

**DMR**:

[Closest non-overlapping DMR to mRNA coding regions](http://gannet.fish.washington.edu/spartina/2018-10-10-project-virginica-oa-Large-Files/2018-12-03-Yaamini-Virginica-Repository/analyses/2018-11-01-DML-and-DMR-Analysis/2018-11-14-Flanking-Analysis/2018-11-14-mRNA-Closest-NoOverlap-DMRs.txt)

**Figure 7**. Distribution of closest non-overlapping DMR to mRNA coding regions with 100 bp of the coding region.

## Next Steps

1. Determine if a formal gene enrichment is necessary
2. If necessary, select the most appropriate gene enrichment method
3. Describe functions of most interesting genes with DML and DMR
4. Update [draft manuscript](https://docs.google.com/document/d/1gOMJrnhs4D-jCKWlJK2tm0Z27IrSqMkmc7K1pDBmqi0/edit#heading=h.r39if6ga2q0r)

## Repository Structure

### [analyses](https://github.com/fish546-2018/yaamini-virginica/tree/master/analyses)

R code and output from multiple analyses. Each analysis will be in its own subdirectory.

- [2018-10-25-MethylKit](https://github.com/fish546-2018/yaamini-virginica/blob/master/analyses/2018-10-25-MethylKit): [R Markdown file](https://github.com/fish546-2018/yaamini-virginica/blob/master/analyses/2018-10-25-MethylKit/2018-10-25-MethylKit.Rmd) and output from `methylKit` identification of DML and DMR.

### [data](https://github.com/fish546-2018/yaamini-virginica/tree/master/data)

Raw data used for project analyses, as well as links to data files.

- [Original sample list from Lotterhos lab](https://github.com/RobertsLab/yaamini-virginica/blob/master/data/OysterTissueInfoSheet_GonadTestRoberts_20171002.xlsx)

### [notebooks](https://github.com/fish546-2018/yaamini-virginica/tree/master/notebooks)

Jupyter notebooks that detail reproducible methods for data analysis.

- [2018-11-01-DML-and-DMR-Analysis.ipynb](https://github.com/fish546-2018/yaamini-virginica/blob/master/notebooks/2018-11-01-DML-and-DMR-Analysis.ipynb): Pipeline for `bedtools` analysis of DML and DMR locations in various genome feature tracks. Includes option to specify variable path names for easy reproducibility.

### [scripts](https://github.com/fish546-2018/yaamini-virginica/tree/master/scripts)

Scripts used for Mox.

- [2018-10-31-Revised-Bismark-Parameters-Samtools](https://github.com/fish546-2018/yaamini-virginica/blob/master/scripts/2018-10-31-Bismark-Revised-Parameters-Samtools.sh): Used to run `bismark` alignment on [MBD-Seq data](http://owl.fish.washington.edu/Athaliana/20180411_trimgalore_10bp_Cvirginica_MBD/). This is an edited version of [2018-10-12-Revised-Bismark-Parameters](https://github.com/fish546-2018/yaamini-virginica/blob/master/scripts/2018-10-12-Bismark-Revised-Parameters.sh) that does not redirect standard error to a new file and includes an explicit path to `bowtie2` and `samtools` in the alignment step.

### [tutorials](https://github.com/fish546-2018/yaamini-virginica/tree/master/tutorials)

Data, notebooks, and analyses from class tutorials.

- [BASH Tutorial in Jupyter Notebook](https://github.com/fish546-2018/yaamini-virginica/tree/master/tutorials/2018-10-09-BLAST-Tutorial)
- [BASH Tutorial in R Markdown](https://github.com/fish546-2018/yaamini-virginica/tree/master/tutorials/2018-10-11-BLAST-Tutorial-in-RMarkdown)
