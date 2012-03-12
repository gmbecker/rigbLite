\name{igbSession-class}
\Rdversion{1.1}
\docType{class}
\alias{igbSession-class}
\alias{region<-,igbSession-method}
\alias{track<-,igbSession,igbTrack-method}

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
	 }
}
\author{
  Gabriel Becker
}
\seealso{
%%  ~~or \code{\linkS4class{CLASSNAME}} for links to other classes ~~~
}
\examples{
showClass("igbSession")
}
\keyword{classes}
\section{Fields}{
  \describe{
    \item{\code{port}:}{Port to which corresponding IGB session is
      listening for instructions. Defaults to 7085 }
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
