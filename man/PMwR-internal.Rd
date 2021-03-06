\name{PMwR-internal}
\alias{PMwR-internal}
\alias{.timestamp}
\alias{.may_be_Date}
\title{Internal Functions}
\description{
  Several internal functions, not exported from the \pkg{PMwR} name space.
}
\usage{
.timestamp(x)
.timestamp(x) <- value

.may_be_Date(x, \dots)
}
\details{

  \code{.timestamp} extracts or replaces an objects timestamp.

  \code{.may_be_Date} checks whether a vector could be
  coerced to class \code{\link{Date}}, in which case it
  evaluates to (a single) \code{TRUE}; otherwise it
  returns \code{FALSE}.

}
\references{

  PMwR manual
}
\author{
  Enrico Schumann
}
\keyword{internal}
