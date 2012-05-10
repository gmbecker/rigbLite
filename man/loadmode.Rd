\name{loadmode}
\alias{loadmode}
\alias{loadmode, igbTrack-method}
\title{
  Get the loadmode of an igbTrack
}
\description{
  Get the loadmode currently stored in an \code{igbTrack} object
}
\usage{
loadmode(object, ...)
}
\arguments{
  \item{object}{
    An igbTrack object to retreive the value from. 
}
  \item{\dots}{
    Unused.
}
}
\value{
  The function returns the loadmode value of \code{object}. In the case
  of an igbTrack object this is a character value.
}
\author{
  Gabriel Becker
}
\seealso{
  \code{\linkS4class{igbTrack}}
}
\examples{
hsaptrk =igbTrack(genome = "H_sapiens_Feb_2009",
  uri="http://netaffxdas.affymetrix.com/quickload_data/H_sapiens_Feb_2009/cytoBand.cyt",
  loadmode="REGION_IN_VIEW", refresh=TRUE
  )

loadmode(hsaptrk)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ loadmode }