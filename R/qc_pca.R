#' PCA plot of raw or normalized data
#'
#' Performs a principal components analysis on the given data matrix and creates a plot of the data projected onto the 2-3 first principal components. The plot is saved into a pdf file.
#' @param data A matrix of expression values, with samples in columns and probes in rows.
#' @param scale a logical value indicating whether the variables should be scaled to have unit variance before the analysis takes place.
#' @param factors A vector with the names of factor variables contained in targets to color samples in pca plots
#' @param targets Targets dataframe with the information of factor variables to plot the pca
#' @param col.group Name of variable in targets containing the colors for Group
#' @param colorlist Vector of RGB colors to be used for factor variables specified in 'factors' other than Group. If is NULL (default), a default colorlist will be used.
#' @param names A vector with sample names corresponding to columns of the data matrix (in the same order)
#' @param batchRemove a logical value indicating whether batch/covariate effects should be removed from the data prior to PCA
#' @param batchFactors Vector with the name of variable(s) from targets dataframe indicating the batches/covariates to be adjusted for
#' @param outputDir Name of the directory where the plot will be saved
#' @param label A string to be included in the file name to be saved
#' @param size Size of labels
#' @param glineas Width of lines rising from labels
#' @import ggplot2 ggrepel
#' @export qc_pca
#' @return Creates a PCA plot into the graphical device, saves it as pdf and returns a list with the loads of PCA.
#' @author Mireia Ferrer Almirall \email{mireia.ferrer.vhir@@gmail.com}
#' @seealso \link[stats]{prcomp}, \link[ggplot2]{ggplot}
#' @examples
#' @keywords PCA
#' @references

qc_pca <- function(data, scale, factors, targets, col.group="Colors", colorlist=NULL, names, batchRemove=FALSE, batchFactors=NULL, outputDir, label, size = 1.5, glineas = 0.25){
    if (is.null(colorlist)){colorlist <- rainbow(ncol(data))}
    if (batchRemove){
        if (is.null(batchFactors)){stop("The variable names of batch factors should be provided.")}
        data <- removebatch(data=data, targets=targets, batchFactors=batchFactors)
        label <- paste0(label, "-corrbatch")
    }
    #compute PCA
    data.pca <- prcomp(t(data), scale=scale)
    loads <- round(data.pca$sdev^2/sum(data.pca$sdev^2)*100, 1)
    #creates pca plots colored by each factor specified and outputs into a list.
    ## here done using lapply. Can also be done using for loop but need to use local environment, otherwise it overwrites the plots in the list (eg. for (i in 1:length(factors)){listplots[[i]] <- local({i <- i; fact <- factors[i]; ... ; print(pcaplot)})}
    listplots <- lapply(factors, function(fact){
        lev <- levels(targets[, fact])
        ifelse (fact=="Group", pcacolors <- unique(targets[, col.group]), pcacolors <- colorlist[1:length(lev)])
        pcatitle <- paste0("Principal Component Analysis for: ", label, ". ", fact)
        pcaplot <- ggplot(data.frame(data.pca$x), aes(x=PC1, y=PC2)) +
            theme_classic() +
            geom_hline(yintercept = 0, color = "gray70") +
            geom_vline(xintercept = 0, color = "gray70") +
            geom_point(aes(color = targets[,fact]), alpha = 0.55, size = 3) +
            coord_cartesian(xlim = c(min(data.pca$x[,1])-5,max(data.pca$x[,1])+5)) +
            # scale_fill_discrete(name = fact) +
            geom_text_repel(aes(y = PC2 + 0.25, label = names), segment.size = 0.25, size = size) +
            labs(x = c(paste("PC1",loads[1],"%")), y=c(paste("PC2",loads[2],"%"))) +
            ggtitle(pcatitle) +
            theme(plot.title = element_text(hjust = 0.5)) +
            scale_color_manual(name=fact, values=pcacolors)
        return(pcaplot)
    })
    #save as pdf
    pdf(file.path(outputDir, paste0("PCA", label, ".pdf")))
    for (j in listplots) {print(j)}
    dev.off()
    #print plot in device
    for (j in listplots) {print(j)}
    return(loads)
}
