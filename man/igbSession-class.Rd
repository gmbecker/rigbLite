\name{igbSession-class}
\Rdversion{1.1}
\docType{class}
\alias{igbSession}
\alias{igbSession-class}
\alias{region<-,igbSession-method}
\alias{track<-,igbSession,igbTrack-method}
\alias{snapshot, igbSession-method}

\title{Class \code{"igbSession"}}
\description{
A reference class representing a running external IGB session
}
\section{Extends}{
All reference classes extend and inherit methods from \code{"\linkS4class{envRefClass}"}.

}
\section{Methods}{
  \describe{
    \item{region<-}{Set the region in the represented IGB session.}
    \item{track<-}{Display the track in the represented IGB session}
    \item{snapshot}{Instruct IGB to save a snapshot (image) of the
      current view}
  }
}
\section{Constructor}{
  \code{igbSession} objects are created by calling the \code{igbSession}
  function. This function accepts an argument for each field listed
  below and constructs the requested \code{igbSession} object. See
  example below.
}
\author{
  Gabriel Becker
}
\seealso{
\code{\linkS4class{igbTrack}}, \code{\linkS4class{igbTrackList}}
}
\examples{
\dontrun{
igb = igbSession(host = "myhost", port = 8000)
}
}
\keyword{classes}
\section{Fields}{
  \describe{
    \item{\code{port}:}{Port to which corresponding IGB session is
      listening for instructions. Defaults to 7085 }
    \item{\code{host}:}{Host on which corresponding IGB session is
      running. Defaults to localhost.}
    \item{\code{connection}:}{Socket connection to \code{port} for use
      in communicating with IGB }
  }
}
\section{Class-Based Methods}{
  \describe{
    \item{\code{showTrack(x, ...)}:}{ Display a \code{igbTrack}.}
    \item{\code{initialize(...)}:}{ ~~ }
    \item{\code{setRegion(x)}:}{ Set viewing region}
  }
}
