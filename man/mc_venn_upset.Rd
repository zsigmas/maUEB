% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mc_venn_upset.R
\name{mc_venn_upset}
\alias{mc_venn_upset}
\title{Venn diagrams and Upset plots}
\usage{
mc_venn_upset(
  listofcsv,
  namescomp,
  label,
  colFeat,
  colPval,
  pval,
  colFC,
  FC,
  pltR = TRUE,
  pltPdf = TRUE,
  pltPng = FALSE,
  venn = TRUE,
  eul = FALSE,
  saveTables = TRUE,
  upsetPlot = FALSE,
  saveTables_extended = TRUE,
  colors = rainbow(length(namescomp)),
  trans = 0.5,
  cex1 = 1,
  rotation = 0,
  position = rep(0, length(namescomp)),
  cex2 = 1,
  include,
  resultsSummFN,
  outputDir
)
}
\arguments{
\item{listofcsv}{list of the dataframes with the toptables}

\item{namescomp}{list with the names of each comparisons}

\item{label}{name that is going to appear in the file}

\item{colFeat}{column by which common genes are searched}

\item{colPval}{column to do the selection (normally Pvalue)}

\item{pval}{p-value by which the selection is done}

\item{FC}{logFC value to select genes}

\item{pltR}{to show or not the image in R}

\item{pltPdf}{to make or not the pdf}

\item{venn}{to perform or not the venn diagrams}

\item{eul}{to draw or not euler plot}

\item{upsetPlot}{to perform or not the upset plots. Normally when there are more than 5 comparisons or when this kind of plot is preferred}

\item{colors}{colors to use for the plots (rainbow by defect)}

\item{trans}{transparency of colors}

\item{cex1}{size of the labels}

\item{rotation}{venn global rotation}

\item{position}{vector with the position in grades of each comparison label}

\item{cex2}{size of the numbers}

\item{include}{direction in which genes are going to be selected (up / down / abs)}

\item{outputDir}{directory in which the results are going to be saved}

\item{csv}{create the csv file with the common genes}
}
\value{
Plot Venn diagramm from 2 to 5 comparisons or UpsetR plot if >5 comparisons
}
\description{
Plot Venn diagramm from 2 to 5 comparisons or UpsetR plot if >5 comparisons. Function based in previous work of Ferran Briansó and Miriam Mota ("https://raw.githubusercontent.com/rgonzalo/GitBackupScripts/master/VennDiagrams/CreateVennEuler.R")
}
\references{

}
\author{
Mireia Ferrer \email{mireia.ferrer.vhir@gmail.com} and Esther Camacho
}
\keyword{Upset}
\keyword{Venn}
\keyword{diagrams}
\keyword{plots}
