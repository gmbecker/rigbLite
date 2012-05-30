\name{showInIGB}
\alias{showInIGB}
\title{
Change current view in IGB
}
\description{
Low level function to directly manipulate what is being shown in a
running IGB session. It is safe for direct use but higher level
interfaces are recommended.
}
\usage{
showInIGB(con, genome = NULL, goto = NULL, dataFile = NULL, loadMode, refresh = TRUE, select = NULL, sleep = NULL)
}
\arguments{
  \item{con}{
    A (socket) connection to a running IGB session.
}
  \item{genome}{
    A character indicating the name of genome (including version) to be shown. Must be in a
    form IGB accepts, eg \code{"H_sapiens_Feb_2009"}. 
}
  \item{goto}{
    A GRanges object indicating the viewing region desired or NULL for
    the default. Should contain one range with the name of the
    chromosome to view in the seqnames slot.
}
  \item{dataFile}{
    A character containing the full path or URL to the data file to be loaded.
}
  \item{loadMode}{
    Character value indicating how the data should be loaded. Must be
    one of "REGION_IN_VIEW", "WHOLE_CHROMOSOME", and "WHOLE_GENOME"
}
  \item{refresh}{
    Logical indicating whether the view should be refreshed after
    loading the data. Defaults to TRUE.
}
  \item{select}{
    A character vector indicating features to be selected.
}
  \item{sleep}{
    Numeric value vindicating number of milliseconds IGB application should
    sleep, or NULL for no sleep.
}
}
\details{
  When this function is called, scripting instructions are sent to the
  specified IGB session via \code{con}
}
\value{
  The return value is not meaningful. When the function is called the
  effects should be immediately apparent in the running IGB session.
}
\references{
  Vora, Hiral. "Scripting", IGB User's Guide, bioviz, Nov 1, 2011.
  http://wiki.transvar.org/confluence/display/igbman/Scripting
}
\author{
  Gabriel Becker

}
\note{
  An IGB session must already be running (and connected to by \code{con})
  before this function is called.
}
\note{
  While the current genome will change immediately in the corresponding IGB
  session (if specified), data can take some time to load once the
  instruction has been sent.
  }
\seealso{
  \code{\link{ViewInIGB}}
}
\examples{
\dontrun{
showInIGB(con = socket("localhost", "7085"), genome
="H_sapiens_Feb_2009", dataFile =
"http://netaffxdas.affymetrix.com/quickload_data/H_sapiens_Feb_2009/cytoBand.cyt",
loadmode = "REGION_IN_VIEW")
}
}
\keyword{ IGB }
\keyword{ Genome }
