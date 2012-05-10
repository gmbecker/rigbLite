\name{snapshot}
\alias{snapshot}
\title{ Take a Snapshot in an External Genome Browser }
\description{
Instruct an external Genome Browser to take a snapshot of its current
display and save it to a specified file.
}
\usage{
snapshot(session, filename, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{session}{
Object representing the genome browser to communicate with
}
  \item{filename}{
    Desired name of the image file to be created.
}
  \item{\dots}{
    Additional options to be passed to individual methods.
}
}
\value{
This function does not return a meaningful value.
}
\author{
Gabriel Becker
}
\keyword{ snapshot }
\keyword{ imagefile }
\keyword{ screenshot }
