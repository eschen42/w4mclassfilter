% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ClassFilter.R
\name{w4m_filter_by_sample_class}
\alias{w4m_filter_by_sample_class}
\title{Filter W4M data matrix by sample-class}
\usage{
w4m_filter_by_sample_class(dataMatrix_in, sampleMetadata_in,
  variableMetadata_in, dataMatrix_out, sampleMetadata_out, variableMetadata_out,
  classes = c(), include = FALSE, class_column = "class",
  samplename_column = "sampleMetadata", name_varmetadata_col1 = TRUE,
  name_smplmetadata_col1 = TRUE, variable_range_filter = c(),
  data_imputation = w4m_filter_imputation, failure_action = function(...) { 
     cat(paste(..., SEP = "\\n")) })
}
\arguments{
\item{dataMatrix_in}{input  data matrix (rows are feature names, columns are sample names}

\item{sampleMetadata_in}{input  sample metadata (rows are sample names, one column's name matches class_column)}

\item{variableMetadata_in}{input  variable metadata (rows are variable names)}

\item{dataMatrix_out}{output data matrix (rows are feature names, columns are sample names}

\item{sampleMetadata_out}{output sample metadata (rows are sample names, one column's name matches class_column)}

\item{variableMetadata_out}{output variable metadata (rows are variable names)}

\item{classes}{character array: names of sample classes to include or exclude; default is an empty array}

\item{include}{logical: TRUE, include named sample classes; FALSE (the default), exclude named sample classes}

\item{class_column}{character: name of "class" column, defaults to "class"}

\item{samplename_column}{character: name of column with sample name, defaults to "sampleMetadata"}

\item{name_varmetadata_col1}{logical: TRUE, name column 1 of variable metadata as "variableMetadata"; FALSE, no change; default is TRUE}

\item{name_smplmetadata_col1}{logical: TRUE, name column 1 of sample metadata as "sampleMetadata"; FALSE, no change; default is TRUE}

\item{variable_range_filter}{character array: array of filters specified as 'variableMetadataColumnName:min:max'; default is empty array}

\item{data_imputation}{function(m): default imputation method for 'intb' data, where intensities have background subtracted - impute zero for NA}

\item{failure_action}{function(x, ...): action to take upon failure - defaults to 'print(x,...)'}
}
\value{
logical: TRUE only if filtration succeeded
}
\description{
Filter a set of retention-corrected W4M files (dataMatrix, sampleMetadata, variableMetadata) by sample-class or feature-attributes
}
\details{
The W4M files dataMatrix, sampleMetadata, and variableMetadata must be a consistent set, i.e.,
there must be metadata in the latter two files for all (and only for) the samples and variables named in the columns and rows of dataMatrix.

For multivariate statistics functions, samples and variables with zero variance must be eliminated, and missing values are problematic.

Furthermore, frequently, it is desirable to analyze a subset of samples (or features) in the dataMatrix.

This function manipulates produces a set of files with imputed missing values, omitting features and samples that are not consistently present within the set or have zero variance.
Secondly, it provides a selection-capability for samples based on whether their sample names match a regular expression pattern; this capability can be used either to select for samples with matching sample names or to exclude them.
Thirdly, it provides a selection-capability for features based on whether their metadata lie within the ranges specified by 'variable_range_filter'.

Inputs (dataMatrix_in, sampleMetadata_in, variableMetadata_in) may be:
\itemize{
\item character: path to input tab-separated-values-file (TSV)
\item data.frame
\item matrix: allowed for dataMatrix_in only
\item list: must have a member named "dataMatrix", "sampleMetadata", or "variableMetadata" for dataMatrix_in, sampleMetadata_in, or variableMetadata_in, respectively.
\item environment: must have a member named "dataMatrix", "sampleMetadata", or "variableMetadata" for dataMatrix_in, sampleMetadata_in, or variableMetadata_in, respectively.
}

Outputs (dataMatrix_out, sampleMetadata_out, variableMetadata_out) may be:
\itemize{
\item character: path to write a tab-separated-values-file (TSV)
\item list: will add a member named "dataMatrix", "sampleMetadata", or "variableMetadata" for dataMatrix_out, sampleMetadata_out, or variableMetadata_out, respectively.
\item environment: will add a member named "dataMatrix", "sampleMetadata", or "variableMetadata" for dataMatrix_out, sampleMetadata_out, or variableMetadata_out, respectively.
}

Please see the package vignette for further details.
}
\examples{
\dontrun{
  # set the paths to your input files
  dataMatrix_in <- "tests/testthat/input_dataMatrix.tsv"
  sampleMetadata_in <- "tests/testthat/input_sampleMetadata.tsv"
  variableMetadata_in <- "tests/testthat/input_variableMetadata.tsv"

  # set the paths to your (nonexistent) output files
  #    in a directory that DOES need to exist
  dataMatrix_out <- "tests/testthat/output_dataMatrix.tsv"
  sampleMetadata_out <- "tests/testthat/output_sampleMetadata.tsv"
  variableMetadata_out <- "tests/testthat/output_variableMetadata.tsv"

  # Example: running the filter to exclude only unwanted samples
  #   include = FALSE means exclude samples with class blankpos
  w4m_filter_by_sample_class(
    dataMatrix_in = dataMatrix_in
  , dataMatrix_out = dataMatrix_out
  , variableMetadata_in = variableMetadata_in
  , variableMetadata_out = variableMetadata_out
  , sampleMetadata_out = sampleMetadata_out
  , sampleMetadata_in = sampleMetadata_in
  , classes = c("blankpos")
  , include = FALSE
  )
}

}
\seealso{
\url{https://github.com/HegemanLab/w4mclassfilter}

\url{http://workflow4metabolomics.org/}
}
\author{
Art Eschenlauer, \email{esch0041@umn.edu}
}
\concept{
w4m workflow4metabolomics
}
\keyword{multivariate}
