The following archive contains the data and scripts for reproducing the [Syed et al. 2024 manuscript](https://doi.org/10.5194/mr-2024-7).


# Requirements

Doing the data processing, analysis, and building the manuscript PDF requires:

- A recent version of R
- The following R packages and their dependencies:
  - `fitnmr` 0.7
  - `knitr`
  - `rticles`
  - `png`
- Pandoc
- TeX distribution

Preprocessing the NMR data and producing the images requires:

- NMRPipe
- PyMOL


# Reproducing the Manuscript

Local copies of all files either downloaded from public repositories or created by data processing steps have been included in this archive. Alternatively, you may use the included shell scripts to download a fresh copy and/or process the data yourself.

Do the following steps to create the manuscript PDF:

- Get GISSMO raw data, either:
  - Run `scripts/fit1d_gissmo_download.sh` script to download
  - Extract local copy: `tar -xzf data/fit1d_gissmo.tar.gz`
- Unzip GISSMO data, run: `scripts/fit1d_gissmo_unzip.sh` script
- Make FID conversion and NMR processing scripts, either:
  - Use `bruker` program in all `fit1d/*/*/*/1H` directories and create nmrproc.com scripts
  - Extract local copy: `tar -xzf data/fit1d_nmrpipe_com.tar.gz`
- Make test.ft1 files, either:
  - Run `scripts/fit1d_nmrpipe_run.sh` script
  - Extract local copy: `tar -xzf data/fit1d_nmrpipe_output.tar.gz`
- Extract FitNMR start parameters: `tar -xzf data/fit1d_fitnmr_start.tar.gz`
- Make FitNMR fit output, either:
  - Run `scripts/fit1d_fitnmr_run.sh` script
  - Extract local copy: `tar -xzf data/fit1d_fitnmr_output.tar.gz`
- Get representative amino acid structures, either:
  - Run `scripts/aa_model_download.sh` script to download
  - Extract local copy: `tar -xzf data/aa_model.tar.gz`
- Make amino acid images, either:
  - Run `aa_images/ile.pml` and `aa_images/beta.pml` in PyMOL
  - Extract local copy: `tar -xzf data/aa_images.tar.gz`
- Render the PDF:
  - Run R and execute: `rmarkdown::render("Syed2024.Rmd")`
  - Open `Syed2024.Rmd` in RStudio and Knit it.


# Online RStudio Instance

[![Binder](http://mybinder.org/badge_logo.svg)](http://mybinder.org/v2/gh/smith-group/syed2024/main?urlpath=rstudio)

The button above will use the free [Binder hosting service](https://mybinder.org) to launch an online RStudio instance in your browser with all the files from this repository. During setup of the instance, all file extraction scripts above are run for you. To create the manuscript PDF from the R Markdown file, just click the `Syed2024.Rmd` file in the lower-right panel and then click the **Knit** button in the upper-left panel. The PDF will open after the process is complete or you can click the created `Syed2024.pdf` file in the lower-right panel.

If you want to interact with the R code in the R Markdown file, you will need to first manually execute code chunks in the appendix, which are found indented in green text towards the top of the file. For each code chunk, select the lines between (but not including) the `` ```{r ...} `` and `` ``` `` lines then click the **Run** button. Code chunks in the main text can be run by clicking the green rightward facing triangle button at the top-right corner of each chunk.

To rerun FitNMR fitting of the amino acid 1D spectra, select the Terminal tab in the lower-left panel and run the `scripts/fit1d_fitnmr_run.sh` script. The input `start_*` CSV and output CSV/PDF files can be examined by browsing the `fit1d` directory in the lower-right panel. 


# NMRBox

As of publication, it is possible to do almost everything above on NMRBox. You will need to do the following first:

- Install fitnmr 0.7 from the [releases page](https://smith-group.github.io/fitnmr_releases/).
- Install Pandoc somewhere in your NMRBox home directory:
  - Download the `linux-amd64` version from the [releases page](https://github.com/jgm/pandoc/releases/).
  - Extract the archive: `tar -xzf pandoc-<version>-linux-amd64.tar.gz`
  - Add it to your `PATH` before running `R`: `export PATH=$PATH:$(pwd)/pandoc-<version>/bin`

If you get an error that `pdflatex` was not found, you will need to transfer the `Syed2024` directory from NMRBox to a different computer with a TeX distribution installed. You can then compile the PDF:

- From the `Syed2024` directory, run: `pdflatex Syed2024.tex ; bibtex Syed2024 ; pdflatex Syed2024.tex ; pdflatex Syed2024.tex`


# Dunbrack Rotamer Library

The Dunbrak 2010 rotamer library dataset (`DatasetForBBDepRL2010.txt`) was obtained by following the instructions here:

http://dunbrack.fccc.edu/lab/bbdep2010

Its license is here (based on Creative Commons CC BY 4.0 license):

http://dunbrack.fccc.edu/lab/bbdep2010_lic
