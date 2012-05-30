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
\note{
  This function will create a snapshot image *on the machine IGB is
  running on*. If the user is communicating with a remote instance of
  IGB, the image will be created on the remote server, not the client machine.
}
\note{
  The snapshot method supports all file exensions that are supported by
  IGB. To see which file types are supported,  navigate in the IGB menu
  to File -> Export -> Main View and inspect the file type options
  offered there. This notably includes the PDF and SVG formats among others.
}
\note{
  Certain versions of IGB do not support use of ~ in paths to indicate
  the user's home directory. For maximum reliability absolute paths should be used.
  }
\examples{
\dontrun{

myigb = igbSession()
snapshot(myigb, "/home/user/myIGBsnapshots/mysnapshot.svg")
}
}
\keyword{ snapshot }
\keyword{ imagefile }
\keyword{ screenshot }
