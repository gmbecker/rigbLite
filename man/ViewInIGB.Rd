\name{ViewInIGB}
\alias{ViewInIGB}
\title{Manipulate Current View in IGB Session }
\description{
 Manipulate view and load data in a running IGB session.
}
\usage{
ViewInIGB(x, genome = NULL, dataFile = NULL, region = NULL, loadMode = "REGION_IN_VIEW", refresh = TRUE, con = socketConnection("localhost", port = 7085, open = "wa"))
}
\arguments{
  \item{x}{
    Main item to load. This can be an \code{igbTrack},
    a \code{QuickloadGenome}, a \code{Quickload} object, or NULL. 
  }
  
  \item{genome}{
    A character value indicating the genome to be loaded
  }
  \item{dataFile}{
    Character value indicating a file containing data to load. See details.
  }
  \item{region}{
    A GRanges object indicating the viewing region desired or NULL for
    the default. Should contain one range with the name of the
chromosome to view in the seqnames slot.
  }
  \item{loadMode}{
   Character value indicating how the data should be loaded. Must be
    one of "REGION_IN_VIEW", "WHOLE_CHROMOSOME", and "WHOLE_GENOME"
  }
  \item{refresh}{
    Logical indicating whether the view should be refreshed after
    loading the data. Defaults to TRUE.
  }
  \item{con}{
    A (socket) connection to a running IGB session.
  }
}
\details{
  This generic function and it's methods are simply convenienve wrappers
  around the \code{showInIGB} function.

  In  the case that \code{x} is a \code{QuickloadGenome} object,
  \code{dataFile} is assumed to be a path relative to the specified genome
  within the specified Quickload bed, ie
  <\code{uri(x)}>/\code{genome}/\code{dataFile}.

  In the case that \code{x} is a \code{Quickload} object, \code{dataFile} is assumed to be a path relative to the specified genome
  within the specified Quickload bed, ie
  <\code{uri(x)}>/\code{genome}/\code{dataFile}.

  In all other cases \code{dataFile} is assumed to be an absolute path
  or URL.

  In the case that any type of information is included in both \code{x}
  and a separate argument (eg \code{x} is a \code{QuickloadGenome} and
  \code{genome} is non-null) values corresponding to \code{x} are always used.

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
\seealso{
\code{\link{showInIGB}}
}
\examples{

\dontrun{
 igbS = igbSession$new()
 ViewInIGB(genome = "H_sapiens_Feb_2009", dataFile =
 "http://netaffxdas.affymetrix.com/quickload_data/H_sapiens_Feb_2009/cytoBand.cyt",
 con = igbS$connection)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ IGB }
\keyword{ genome }
