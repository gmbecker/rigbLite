\name{igbTrack-class}
\Rdversion{1.1}
\docType{class}
\alias{igbTrack}
\alias{igbTrack-class}
\alias{genome<-,igbTrack-method}
\alias{genome,igbTrack-method}
\alias{loadmode<-,igbTrack-method}
\alias{loadmode,igbTrack-method}
\alias{refresh<-,igbTrack-method}
\alias{refresh,igbTrack-method}
\alias{region<-,igbTrack-method}
\alias{region,igbTrack-method}
\alias{uri<-,igbTrack-method}
\alias{uri,igbTrack-method}
\alias{ViewInIGB,igbTrack,ANY,ANY-method}

\title{Class \code{"igbTrack"}}
\description{
This class represents a single "track" within IGB's display
portion. Slots indicate all information IGB requires to add the track to
the current display.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("igbTrack", ...)}.
}
\section{Slots}{
  \describe{
    \item{\code{genome}:}{A character value indicating the genome in
      question. Must be of the form used by IGB, eg H_apiens_Feb_2009}
    \item{\code{loadmode}:}{Character value indicating how the data should be loaded. Must be
    one of "REGION_IN_VIEW", "WHOLE_CHROMOSOME", and "WHOLE_GENOME"}
    \item{\code{refresh}:}{Logical indicating whether the view should be refreshed after
    loading the data. Defaults to TRUE.}
    \item{\code{uri}:}{A character value containing the full path or URL to the
      file containing data for the track.
 }
  }
}
\section{Methods}{
  \describe{
    \item{genome<-}{Sets the \code{genome} value for the track. }
    \item{genome}{Returns the current value genome of the track. }
    \item{loadmode<-}{Sets the \code{loadmode} value for the track.}
    \item{loadmode}{Returns the current \code{loadmode} for the slot. }
    \item{refresh<-}{Sets the \code{refresh} value for the track.}
    \item{refresh}{Returns the current refresh value for the track.}
    \item{track<-}{Displays the indicated \code{igbTrack} in the \code{igbSession}}
    \item{uri<-}{Sets the URI of the data to be displayed by the track. }
    \item{uri}{Returns the URI for the data displayed by the track. }
    \item{ViewInIGB}{Show track in running IGB session}
	 }
}
\references{
  Vora, Hiral. "Scripting", IGB User's Guide, bioviz, Nov 1, 2011.
  http://wiki.transvar.org/confluence/display/igbman/Scripting
}
\author{
  Gabriel Becker
}
\seealso{
\code{\linkS4class{igbSession}} 
}
\examples{
hsaptrk =igbTrack(genome = "H_sapiens_Feb_2009",
  uri="http://netaffxdas.affymetrix.com/quickload_data/H_sapiens_Feb_2009/cytoBand.cyt",
  loadmode="REGION_IN_VIEW", refresh=TRUE
  )

}
\keyword{igbTrack}
\keyword{igb}
