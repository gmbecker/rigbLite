\name{trackList<-}
\alias{trackList<-}
\alias{trackList<-, igbSession-method}
\title{
  Display Multiple Track in an External Genome Browser
}
\description{
  Display multiple Tracks based on the same genome within an external
  genome browser.
}
\usage{
trackList(object, ...) <- value
}
\arguments{
  \item{object}{
    Object representing the genome browser (eg an igbSession object)
}
  \item{\dots}{
    Unused.
}
  \item{value}{
    Object containing tracks to be displayed (eg an igbTrackList objecT)
}
}
\value{
This function instructs the external Genome Browser to display the
tracks contained in \code{value}. It does not have a meaningful return value.
}
\author{
  Gabriel Becker
}
\seealso{
  \code{\link{igbTrackList}}
}
\examples{
\dontrun{
igb = igbSession()
trk = igbTrack( genome = "A_thaliana_Jun_2009",
  loadmode = "REGION_IN_VIEW", refresh=TRUE,
  uri ="http://igbquickload.org/quickload/A_thaliana_Jun_2009/TAIR10_mRNA.bed.gz")

trk2 = igbTrack(genome = "A_thaliana_Jun_2009",
  loadmode = "REGION_IN_VIEW", refresh=TRUE,
  uri ="http://igbquickload.org/quickload/A_thaliana_Jun_2009/TAIR9_mRNA.bed.gz")

myTrackList = igbTrackList(trk, trk2)

trackList(igb) <- myTrackList
}
}
\keyword{track}
