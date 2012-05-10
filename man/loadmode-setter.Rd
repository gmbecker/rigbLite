\name{loadmode<-}
\alias{loadmode<-}
\alias{loadmode<-, igbTrack-method}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Set loadmode of an igbTrack
}
\description{
Set the loadmode parameter of an igbTrack, controlling the specifics of
how IGB loads the data when displaying the track.
}
\usage{
loadmode(object, ...)<-value
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
    The Track object to alter.
}
  \item{\dots}{
    Unused
}
  \item{value}{
    The new loadmode for the track. Possible values are "NO_LOAD",
    "REGION_IN_VIEW", "CHROMOSOME", and "GENOME"
}
}
\value{
  \code{object} is altered in-place to reflect the new loadmode.
}
\author{
  Gabriel Becker
}
\seealso{
  \code{\link{loadmode}}
}
\examples{
hsaptrk =igbTrack(genome = "H_sapiens_Feb_2009",
  uri="http://netaffxdas.affymetrix.com/quickload_data/H_sapiens_Feb_2009/cytoBand.cyt",
  loadmode="REGION_IN_VIEW", refresh=TRUE
  )
loadmode(hsaptrk) = "CHROMOSOME"
}
\keyword{ loadmode }