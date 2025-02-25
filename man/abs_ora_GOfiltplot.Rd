% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/abs_ora_GOfiltplot.R
\name{abs_ora_GOfiltplot}
\alias{abs_ora_GOfiltplot}
\title{GO filt ORA}
\usage{
abs_ora_GOfiltplot(
  ORAresGO,
  sign,
  GO_pvalcutoff,
  GO_pAdjustMethod,
  saveTables,
  GOPlots,
  label,
  resultsSummFN,
  outputDir
)
}
\arguments{
\item{ORAresGO}{<- Object resulting from the function 'abs_ORA_GOunfilt'}

\item{sign}{<- vector of length namescomp composed of one number for comparison: +1 for up -1 for down or 0 for abs}

\item{GO_pvalcutoff}{<- Thresholds of p-value for GO analysis (in this order: BP, CC, MF)}

\item{GO_pAdjustMethod}{<- Adjustment method for each GO category to analyse (CC, BP, MF) in each comparison}

\item{GOPlots}{<- Whether to generate plots or not}

\item{label}{<- Label to use in some file names}

\item{resultsSummFN}{<- Name of the file where a summary of the results will be saved}
}
\value{
Creates dataframes of GO results filtered by pvalue and performs a GO overrespresentation analysis, giving some plots with the most overrepresented GO terms pathways.
}
\description{
Creates dataframes of GO results filtered by pvalue and performs a GO significance analysis, giving some plots with the most enriched GO terms pathways.
}
\references{

}
\author{
Mireia Ferrer \email{mireia.ferrer.vhir@gmail.com}
}
\keyword{GO}
\keyword{ORA}
\keyword{plots}
