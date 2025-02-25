#' Create a Targets file template
#'
#' Lists the cel files in a directory and creates a csv2 file containing a dataframe with the file names and phenotypic data to be filled in.
#' @param outputDir Name of the directory where the targets file will be saved.
#' @param inputDir Name of the directory containing the .CEL files.
#' @param client Initials of client
#' @param ID Study UEB id
#' @param descriptors Variable names to include in dataframe (eg. "FileName","Group", "ShortName", "Colors", "Batch")
#' @export build_targets
#' @author Mireia Ferrer \email{mireia.ferrer.vhir@@gmail.com}
#' @examples
#' @return targets A dataframe listing the CEL file names and the covariables
#' @keywords celfiles targets
#' @references

build_targets <- function(inputDir, outputDir, client, ID, descriptors){
    #List files contained in inputDir
    FileName <- list.files(inputDir, pattern=NULL, all.files=FALSE, recursive = FALSE,
                           full.names=FALSE, include.dirs = TRUE, no..=FALSE)
    #Create dataframe with the variables to be included and save as  .csv file (separator=";")
    lFile <- as.data.frame(matrix(0, ncol = length(descriptors), nrow = length(FileName)))
    colnames(lFile) <- descriptors
    lFile$FileName <- FileName
    write.csv2(lFile, file.path(outputDir, paste("targets", client, ID, "template.csv", sep = ".")),
               row.names = FALSE)
}
