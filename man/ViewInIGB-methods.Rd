\name{ViewInIGB-methods}
\docType{methods}
\alias{ViewInIGB-methods}
\alias{ViewInIGB,ANY,ANY,ANY-method}
\alias{ViewInIGB,ANY,ANY,character-method}
\alias{ViewInIGB,Quickload,character,character-method}
\alias{ViewInIGB,QuickloadGenome,ANY,character-method}
\title{Manipulate Current View in IGB Session }
\description{
 Manipulate view and load data in a running IGB session.
}
\section{Methods}{
\describe{

\item{\code{signature(x = "ANY", genome = "ANY", dataFile = "ANY")}}{
Default method.
}

\item{\code{signature(x = "ANY", genome = "ANY", dataFile = "character")}}{
dataFile is assumed to be an absolute path.
}

\item{\code{signature(x = "igbTrack", genome = "ANY", dataFile = "ANY")}}{
Sets view to that specified by the igbTrack object. Other arguments are ignored.
}

\item{\code{signature(x = "Quickload", genome = "character", dataFile = "character")}}{
\code{dataFile} is assumed to be a path relative to the specified genome
within the specified Quickload bed, ie <\code{uri(x)}>/\code{genome}/\code{dataFile}.
}

\item{\code{signature(x = "QuickloadGenome", genome = "ANY", dataFile = "character")}}{
\code{dataFile} is assumed to be a path relative to the URI of the passed in
QuickloadGenome object, ie <\code{uri(x)}>/\code{dataFile}.
}
}}
\keyword{methods}
\keyword{ ViewInIGB }
\keyword{ IGB }
