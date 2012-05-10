\name{region<-}
\alias{region<-}
\alias{region<-, GRanges-method}
\title{
  Set the Viewing Region
}
\description{
Set the viewing region in an external genome browser
}
\usage{
region(object) <- value
}
\arguments{
  \item{object}{
    An object representing the browser
}
  \item{value}{
    A GRanges object with a single range indicating the location
    (including chromosome found in seqnames) to shift the viewing region to.
}
}
\value{
  This function initiates an action within the external Genome Browser
  and does not have a meaningful return value.
}
\author{
  Gabriel Becker
}
\examples{
\dontrun{
igb = igbSession(host = "myhost", port = 8000)
region(igb) = GRanges(seqnames="chr4", IRanges(500, 10000))
}
}% R documentation directory.
\keyword{ Genome }
\keyword{ Browser }% __ONLY ONE__ keyword per line
