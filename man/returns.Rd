\name{returns}
\alias{returns}
\alias{.returns}
\alias{p_returns}
\alias{returns.default}
\alias{returns.zoo}
\alias{print.p_returns}
\alias{toLatex.p_returns}
\alias{toHTML.p_returns}
\title{
  Compute Returns
}
\description{
  Convert prices into returns.
}
\usage{
returns(x, \dots)

\method{returns}{default}(x, t = NULL, period = NULL, complete.first = TRUE,
        pad = NULL, position = NULL, 
        weights = NULL, rebalance.when = NULL,
        lag = 1, \dots)

\method{returns}{zoo}(x, period = NULL, complete.first = TRUE,
        pad = NULL, position = NULL,
        weights = NULL, rebalance.when = NULL, lag = 1, \dots)

\method{print}{p_returns}(x, \dots, year.rows = TRUE, month.names = NULL,
      zero.print = "0", plus = FALSE, digits = 1,
      na.print = NULL)

\method{toLatex}{p_returns}(object, \dots,
        year.rows = TRUE, ytd = "YTD", month.names = NULL, 
        eol = "\\\\\\\\", stand.alone = FALSE)

\method{toHTML}{p_returns}(x, \dots,
       year.rows = TRUE, ytd = "YTD", month.names = NULL, 
       stand.alone = TRUE, table.style = NULL, table.class = NULL, 
       th.style = NULL, th.class = NULL,
       td.style = "text-align:right; padding:0.5em;", 
       td.class = NULL, tr.style = NULL, tr.class = NULL, 
       browse = FALSE)

.returns(x, pad = NULL, lag)
}
\arguments{
  \item{x}{

    for the default method, a \code{numeric} vector
    (possibly with a \code{dim} attribute; i.e. a
    matrix) of prices.  \code{returns} also supports
    \code{x} of other classes, such as \code{zoo} or
    \code{\link{NAVseries}}. For time-series classes,
    argument \code{t} should be \code{NULL}.

    For \code{.returns}, \code{x} must be
    \code{numeric} (for other classes, \code{.returns}
    may not work properly).
    
  }
  \item{t}{
    
    timestamps. See arguments \code{period} and
    \code{rebalance.when}.
    
  }
  \item{period}{
    
    Typically \code{character}; supported are
    \code{"hour"}, \code{"day"}, \code{"month"},
    \code{"quarter"}, \code{"year"},
    \code{"ann"} (annualised), \code{"ytd"}
    (year-to-date), \code{"mtd"} (month-to-date), \code{"itd"}
    (inception-to-date) or a single year, such as
    "2012".  The value of \sQuote{period} is used only
    when timestamp information is available: for
    instance, when \code{t} is not \code{NULL} or with
    \code{zoo}/\code{xts} objects.

    All returns are computed as simple returns. They
    will only be annualised with option \code{"ann"}; they
    will not be annualised when the length of the time
    series is less than one year. To force annualising
    in such a case, use
    \code{"ann!"}. Annualisation can only work
    when the timestamp \code{t} can be coerced to class
    \code{\link{Date}}. The result will have an
    attribute \code{is.annualised}, which is a logical
    vector of length one.

  }
  \item{complete.first}{

    logical. For holding-period returns such an monthly
    or yearly, should the first period (if incomplete)
    be used.

  }
  \item{pad}{

    either \code{NULL} (no padding of initial lost
    observation) or a value used for padding
    (reasonable values might be \code{\link{NA}} or
    \code{0})

  }
  \item{position}{

    numeric; the same length/dimension as
    \code{x}. \strong{This argument is currently ignored.}

  }
  \item{weights}{

    either a numeric vector of the same length as the
    number of assets (i.e. \code{ncol(x)}), or a
    numeric matrix whose dimensions match those of
    prices (i.e. \code{dim(x)} must equal
    \code{dim(weights)})

  }
  \item{rebalance.when}{

    logical or numeric. If \code{x} is a time-series
    class (such as \code{zoo}), it may also be of the
    same class as the time index of \code{x}.

  }
  \item{\dots}{
    further arguments to be passed to methods
  }

  \item{year.rows}{

    logical. If \code{TRUE} (the default), print
    monthly returns with one row per year.

  }
  \item{zero.print}{

    character.  How to print zero values.

  }
  \item{na.print}{

    character.  How to print \code{NA} values. (Not
    supported yet.)

  }
  \item{plus}{

    logical. Add a \sQuote{\code{+}} before positive
    numbers? Default is \code{FALSE}.

  }
  \item{lag}{

    The lag for computing returns. A positive integer,
    defaults to one; ignored for time-weighted returns
    or if \code{t} is supplied.

  }
  \item{object}{

    an object of class \code{p_returns} (\sQuote{period
    returns})

  }
  \item{month.names}{

    character: names of months. Default is an
    abbreviated month name as provided by the
    locale. That may cause trouble, notably with
    \code{toLatex}, if such names contain
    non-\acronym{ASCII} characters: a safe choice is
    either the numbers 1 to 12, or the character vector
    \code{\link{month.abb}}, which lives in the base
    package.
    
  }
  \item{digits}{

    number of digits in table

  }
  \item{ytd}{

    header for YTD

  }
  \item{eol}{character}
  \item{stand.alone}{logical or character}
  \item{table.class}{character}
  \item{table.style}{character}
  \item{th.class}{character}
  \item{th.style}{character}
  \item{td.class}{character}
  \item{td.style}{character}
  \item{tr.class}{character}
  \item{tr.style}{character}
  \item{browse}{

    logical: open table in browser?

  }
}
\details{

  \code{returns} is a generic function.  It computes
  simple returns: current values divided by prior
  values minus one.  The default method works for
  numeric vectors/matrices.  The function
  \code{.returns} does the actual computations and may
  be used when a \sQuote{raw} return computation is
  needed.

  
  \subsection{Holding-Period Returns}{
    
    When a timestamp is available, \code{returns} can
    compute returns for specific calendar periods. See
    argument \code{period}.
    
  }
  
  \subsection{Portfolio Returns}{
    
    \code{returns} may compute returns for a portfolio
    specified in \code{weights}. The portfolio is
    rebalanced at \code{rebalance.when}; the default is
    every period.
    
    \code{rebalance.when} may either be logical,
    integers or of the same class as a \code{timestamp}
    (e.g. \code{\link{Date}}).
  }

}
\value{

  If called as \code{returns(x)}: a numeric vector or
  matrix, possibly with a class attribute (e.g. for a
  \code{zoo} series).

  If called with a \code{period} argument: an object of
  class \code{"p_returns"} (period returns), which is a
  numeric vector of returns with attributes \code{t}
  (timestamp) and \code{period}.  Main use is to have
  methods that pretty-print such period returns;
  currently, there are methods for
  \code{\link{toLatex}} and
  \code{\link[tools]{toHTML}}.

  In some cases, additional attributes may be attached:
  when portfolio returns were computed (i.e. argument \code{weights}
  was specified), there are attributes \code{holdings}
  and \code{contributions}. For holding-period returns,
  there may be a logical attribute
  \code{is.annualised}, and an attribute
  \code{from.to}, which tells the start and end date of
  the holding period.
      
}
\author{
  Enrico Schumann <es@enricoschumann.net>
}
\seealso{
  \code{\link{btest}}, \code{\link{pl}}
}
\examples{
x <- 101:105
returns(x)
returns(x, pad = NA)
returns(x, pad = NA, lag = 2)


## monthly returns
t <- seq(as.Date("2012-06-15"), as.Date("2012-12-31"), by = "1 day")
x <- seq_along(t) + 1000
returns(x, t = t, period = "month")
returns(x, t = t, period = "month", complete.first = FALSE)

### formatting
print(returns(x, t = t, period = "month"), plus = TRUE, digits = 0)

## returns per year (annualised returns)
returns(x, t = t, period = "ann")  ## less than one year, not annualised
returns(x, t = t, period = "ann!") ## less than one year, *but* annualised

is.ann <- function(x)
    attr(x, "is.annualised")

is.ann(returns(x, t = t, period = "ann"))   ## FALSE
is.ann(returns(x, t = t, period = "ann!"))  ## TRUE


## with weights and fixed rebalancing times
prices <- cbind(p1 = 101:105,
                p2 = rep(100, 5))
R <- returns(prices, weights = c(0.5, 0.5), rebalance.when = 1)
## ... => resulting weights
h <- attr(R, "holdings")
h*prices / rowSums(h*prices)
}
