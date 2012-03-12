\name{igbTrack-class}
\Rdversion{1.1}
\docType{class}
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
    \item{\code{region}:}{GRanges object indicating the viewing region
      for the track. The name of the chromosome to be viewed must be in
      the \code{seqnames} slot.}
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
    \item{genome<-}{Sets the \code{genome} slot of the track. }
    \item{genome}{Returns the current value of the \code{genome} slot. }
    \item{loadmode<-}{Sets the \code{loadmode} slot of the track.}
    \item{loadmode}{Returns the current value of the \code{loadmode} slot. }
    \item{refresh<-}{Sets the \code{refresh} slot of the track.}
    \item{refresh}{Returns the current value of the refresh slot.}
    \item{region<-}{Sets the \code{region} slot of the track.}
    \item{region}{Returns the current value of the \code{region} slot.}
    \item{track<-}{Displays the indicated \code{igbTrack} in the \code{igbSession}}
    \item{uri<-}{Sets the \code{uri} slot of the track. }
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
showClass("igbTrack")
}
\keyword{igbTrack}
\keyword{igb}
