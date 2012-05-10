\name{snapshot-methods}
\docType{methods}
\alias{snapshot-methods}
\alias{snapshot,igbSession-method}
\title{ Take a Snapshot in an External Genome Browser }
\description{
  Methods for the \code{snapshot} function which allows users to take
  snapshots of the view within external Genome Browsers from within R.
}
\section{Methods}{
\describe{

\item{\code{signature(session = "igbSession")}}{
  Take a snapshot of the current view in an IGB session.
  Additional Arguments:
  \describe{
    \item{view}{
      What region of the IGB screen should be captured. Options are
      "full", "main", and "sliced".
    }
    \item{labels}{
      Whether IGB should include labels in the screenshot. This is
      ignored unless the "main" view is selected.
    }
  }
}}}
\keyword{methods}
\keyword{ screenshot }
\keyword{ snapshot}
\keyword{ IGB }

