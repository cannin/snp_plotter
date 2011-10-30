\name{snp.plotter} 
\alias{snp.plotter} 
\title{SNP/haplotype association p-value and linkage disequilibrium plotter}
\description{Creates plots of p-values using single SNP and/or haplotype data. Main features of the package include options to display a linkage disequilibrium (LD) plot and the ability to plot multiple set of results simultaneously. Plots can be created using global and/or individual haplotype p-values along with single SNP p-values. Images are created as either PDF/EPS files.}
\usage{snp.plotter(EVEN.SPACED = FALSE, 
		PVAL.THRESHOLD = 1, 
		USE.GBL.PVAL = TRUE, 
		SYMBOLS = NA, 
		SAMPLE.LABELS = NULL, 
		LAB.Y = "log", 
		DISP.HAP = FALSE, 
		DISP.SNP = TRUE, 
		DISP.COLOR.BAR = TRUE, 
		DISP.PHYS.DIST = TRUE, 
		DISP.LEGEND = TRUE, 
		DISP.MARKER.LINES = TRUE, 
		DISP.LDMAP = FALSE, 
		DISP.TYPE = "symbol", 
		DISP.MULT.LAB.X = FALSE, 
		DISP.SNP.NAMES = TRUE,
		DISP.CONNECTING.LINES = TRUE,
		LD.TYPE = "dprime", 
		LD.COLOR.SCHEME = "heat", 
		USE.COLORS = TRUE, 
		COLOR.LIST = NULL, 
		PALETTE.FILE = NULL, 
		IMAGE.TITLE = NULL, 
		IMAGE.NAME = "snp.plotter", 
		IMAGE.TYPE = "pdf", 
		IMAGE.SIZE = 3.5,  
		CONNECTING.LINES.FACTOR = 1, 
		CONNECTING.LINES.ADJ = 0, 
		CONNECTING.LINES.VERT.ADJ = -1, 
		CONNECTING.LINES.FLEX = 0, 
		SNP.FILE = NULL, 
		HAP.FILE = NULL, 
		GENOTYPE.FILE = NULL, 
		FONT.FACTOR = NULL,
		SYMBOL.FACTOR = NULL, 
		config.file = NULL
		)
 } 
\arguments{
	\item{config.file}{Name of a configuration file for snp.plotter parameters in the form ATTRIBUTE=value. This option can be used in place of specifying options at the R command line.}
	\item{SNP.FILE}{Tab-delimited input file containing p-values for single SNPs (see note below). The contents of each SNP.FILE includes four necessary columns ASSOC, SNP.NAME, LOC, and SS.PVAL corresponding to positive or negative association (indicating susceptibility or protective alleles), a SNP label, the location, and a p-value for each SNP. SNP labels cannot start with numbers. Example: "s1.txt,s2.txt,s3.txt" MANDATORY}
	\item{HAP.FILE}{Tab-delimited input file containing p-values for haplotypes (see note below). The contents of each HAP.FILE includes three necessary columns ASSOC, G.PVAL, and I.PVAL followed by a set of columnns of SNPs with corresponding haplotypes. Haplotypes are presented in a step-wise fashion with the major allele given as 1 and the minor allele as 2; haplotype variants for a set of SNPs should be grouped. SNP labels in HAP.FILE must be the same as in SNP.FILE, and only SNPs with corresponding haplotypes need to be included. Example: "h1.txt,h2.txt,h3.txt" OPTIONAL}
	\item{GENOTYPE.FILE}{Tab-delimited input file containing genotypes as a PED file with 6 columns preceding the genotype data: family ID, individual ID, father ID, mother ID, sex, and affection status; these coloums are not used in the creation of the LD plot. This file is used for calculating D' or r-squared values for the LD heatmap plot. Only one LD plot can be shown (see note below). OPTIONAL}
	\item{EVEN.SPACED}{Logical. Should the p-values be displayed at even spacing or at genetic map distances?}
	\item{USE.GBL.PVAL}{Logical. Use global haplotype p-values (as opposed to individual p-values)? Unfilled symbols connected by solid lines are used to indicate global haplotype p-values, default symbol: circle. Unfilled and filled symbols are used to indicate alleles 1 and 2, respectively connected by solid lines and dashed lines for positive and negative association (indicating susceptibility or protective haplotypes) when using individual haplotype p-values. }
	\item{DISP.HAP}{Logical. Display haplotype p-values?}
	\item{DISP.SNP}{Logical. Display single SNP p-values?}
	\item{DISP.LDMAP}{Logical. Display the LD heatmap?}
	\item{DISP.PHYS.DIST}{Logical. Display the range of the X-scale?}
	\item{DISP.LEGEND}{Logical. Display a legend with sample labels and corresponding symbols?}
	\item{DISP.COLOR.BAR}{Logical. Display bar showing colors and corresponding values of LD plot?}
	\item{DISP.TYPE}{Options: "symbol"}
	\item{DISP.MULT.LAB.X}{Logical. Display evenly spaced X-axis tick-labels; up to 5 labels are shown.}
	\item{DISP.MARKER.LINES}{Logical. Display lines at p-value thresholds of 0.05, 0.01, 0.001, etc.}
	\item{DISP.SNP.NAMES}{Logical. Display the names of SNPs on a plot.}
	\item{DISP.CONNECTING.LINES}{Logical. Display connecting lines from p-value plot to LD map.}
	\item{USE.COLORS}{Logical. Restrict LD heatmap colors and default symbol colors to gray-scale}
	\item{COLOR.LIST}{List of colors (one for each sample) known to GraphApp (see note below) for displaying p-value symbols. Example: "red,blue,green,black,orange"}
	\item{SYMBOLS}{Options: circle, square, diamond, triangle; Symbols can either be filled or not filled by appending "-fill" e.s., square-fill. NA may be specified. In this case, the SNP.FILE ASSOC column is read and an up-triangle and down-triangle are used to indicate positive and negative association (indicating susceptibility or protective alleles), respectively. Example: "circle,NA,diamond-fill,triangle"}
	\item{PALETTE.FILE}{Colors are hexidecimal HTML color codes; one color per line. OPTIONAL}
	\item{SAMPLE.LABELS}{Labels for each sample. Example: "d-cc,d2-cc,d1-fam"}
	\item{LAB.Y}{Options: ln (natural log) or log (log10)}
	\item{IMAGE.TYPE}{Options: "pdf" or "eps"}
	\item{IMAGE.TITLE}{Title of the image in quotes. Note: Title text may not wrap.}
	\item{IMAGE.SIZE}{Options: 3.5 or 7. Sizes are in inches and correspond to 1 or 2 columns per printed page.}
	\item{IMAGE.NAME}{Name of the output file. The correct extension will be appended depending on the value of IMAGE.TYPE}
	\item{PVAL.THRESHOLD}{The minimum value of the the Y-scale will be set to this value. Default: 1 (to ignore option). }
	\item{LD.TYPE}{LD metric. Options: "dprime" or "rsquare"}
	\item{LD.COLOR.SCHEME}{LD heatmap color scheme. Options: heat (red-yellow-white), cm (cyan-magenta), topo (topographical map colors), gray (gray-scale), or custom; custom requires palette file (PALETTE.FILE) to be defined}
	\item{CONNECTING.LINES.FACTOR}{Adjusts the length of the connecting lines. Range: 0-2}
	\item{CONNECTING.LINES.ADJ}{Can be used to adjust the position of connecting lines in relation to SNP names. Negative values shift the connecting lines to the left and positive values shift the lines to the right. Range: 0-1}
	\item{CONNECTING.LINES.VERT.ADJ}{Can be used to vertically adjust the position of connecting lines in relation to SNP names. More negative value shift the connecting lines down. Range: -0.5-0}	
	\item{CONNECTING.LINES.FLEX}{Adjusts the spread of the connecting lines. Range: 0-2}	
	\item{SYMBOL.FACTOR}{Scaling value for symbols. Larger values are generate larger symbols. Range: 0-1}	
	\item{FONT.FACTOR}{Scaling value for SNP names. Larger values are generate larger SNP names. Range: 0-1}	
} 
\value{A list containing two items: config.var and gbl.var, which includes the values of all significant variables used by snp.plotter}
\details{snp.plotter produces publishable-quality plots of p-values using single SNP 
and/or haplotype data. Main features of the package include options to display a
 linkage disequilibrium (LD) plot below the p-value plot using either the r-squared or 
D' LD metric with a user-specified LD heatmap color scheme, setting the X-axis 
to equal spacing or to use the physical SNP map, and specification of plot 
labels, colors and symbols for desplaying p-values. A major strength of the 
package is that it can plot multiple set of results simultaneously. Plots can be 
created using global and/or individual haplotype p-values along with single SNP 
p-values. The package provides a simple way to convey both association and LD 
information in a single appealing graphic and requires virtually no knowledge 
of the R programming language. Code to create the LD map was modified from the
LDHeatmap package by Ji-Hyung Shin, et al. (2006, version 0.2)} 
\note{
\itemize{
\item{Configuration Files}{Due to the large number of parameters implemented for flexibility, it is suggested that snp.plotter be run using the config.file argument.}
\item{Example Datasets}{Examples of SNP.FILE, HAP.FILE, GENOTYPE.FILE, and configuration files are provided at \url{http://cbdb.nimh.nih.gov/~kristin/snp.plotter.html} with further explanation on the file formats.}
\item{Lists}{Comma delimited lists (SNP.FILE, HAP.FILE, COLOR.LIST, SYMBOLS, etc) should not have spaces between entries. If using the config.file argument, these lists should not have quotations in the configuration file. Example: "red,blue,green,black,orange"}
\item{Colors}{COLOR.LIST colors are limited to those known to GraphApp. A short list can be found at \url{http://en.wikipedia.org/wiki/X11.color.names}; the complete list is located in the R source code file}
\item{Palettes}{PALETTE.FILE colors are hexidecimal HTML color codes \url{http://en.wikipedia.org/wiki/X11.color.names}. The first and last colors correspond to the lowest and highest value of the chosen LD metric, respectively. One color per line.}
\item{PDFs}{The error "unable to start device pdf" may occur when attempting to overwrite an open PDF document.}
\item{P-values}{A p-value of 1 or NA can be used in SNP.FILE to prevent displaying information about a single SNP}
\item{Number of Datasets}{snp.plotter handles 10 set of results, but provides default values for only 5 set of results}
\item{File Input}{All input files should be placed in the same directory}
}
}
\examples{	
\dontrun{
	snp.plotter(config.file = "config.txt")
}
\dontrun{
	snp.plotter(EVEN.SPACED = FALSE, 
		PVAL.THRESHOLD = 1, 
		USE.GBL.PVAL = TRUE, 
		SYMBOLS = NA, 
		SAMPLE.LABELS = NULL, 
		LAB.Y = log, 
		DISP.HAP = FALSE, 
		DISP.SNP = TRUE, 
		DISP.COLOR.BAR = TRUE, 
		DISP.PHYS.DIST = TRUE, 
		DISP.LEGEND = TRUE, 
		DISP.MARKER.LINES = TRUE, 
		DISP.LDMAP = FALSE, 
		DISP.TYPE = "symbol", 
		DISP.MULT.LAB.X = FALSE, 
		DISP.SNP.NAMES = TRUE,
		DISP.CONNECTING.LINES = TRUE,
		LD.TYPE = "dprime", 
		LD.COLOR.SCHEME = "heat", 
		USE.COLORS = TRUE, 
		COLOR.LIST = NULL, 
		PALETTE.FILE = NULL, 
		FONT.FACTOR = NA,
		IMAGE.TITLE = NULL, 
		IMAGE.NAME = "snp.plotter", 
		IMAGE.TYPE = "pdf", 
		IMAGE.SIZE = 3.5,  
		CONNECTING.LINES.FACTOR = 1, 
		CONNECTING.LINES.ADJ = 0, 
		CONNECTING.LINES.VERT.ADJ = 0, 
		CONNECTING.LINES.FLEX = 0, 
		SNP.FILE = NULL, 
		HAP.FILE = NULL, 
		GENOTYPE.FILE = NULL, 
		FONT.FACTOR = NULL,
		SYMBOL.FACTOR = NULL, 
		config.file = NULL
		)
}
}  
\author{Augustin Luna \email{augustin.luna@mail.nih.gov}, Kristin K. Nicodemus \email{kristin.nicodemus@well.ox.ac.uk}, \email{nicodemusk@mail.nih.gov}. Website: \url{http://cbdb.nimh.nih.gov/~kristin/snp.plotter.html}}
\keyword{aplot}
\keyword{hplot}

