\name{uri<-}
\alias{uri<-}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Set the URI value of an object
}
\description{
Set the URI value on an object.
}
\usage{
uri(object, ...) <- value
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
    The object to alter
}
  \item{\dots}{
    Additional arguments for individual methods
}
  \item{value}{
    New value for the uri of the object.
}
}
\details{
  This function is a generic setter function for uri. It alters the
  object in place.
}
\value{
Modifies \code{object} in-place.
}
\author{
  Gabriel Becker
}
\seealso{
  \code{\link{uri}} \code{\link{igbTrack}}
}
\examples{
hsaptrk =igbTrack(genome = "H_sapiens_Feb_2009",
  uri="http://netaffxdas.affymetrix.com/quickload_data/H_sapiens_Feb_2009/cytoBand.cyt",
  loadmode="REGION_IN_VIEW", refresh=TRUE
  )
uri(hsaptrk) <-
"http://netaffxdas.affymetrix.com/quickload_data/H_sapiens_Feb_2009/chr3.bnib"
uri(hsaptrk)
}
\keyword{ uri }