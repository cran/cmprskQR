\name{summary.crrQR}
\alias{summary.crrQR}
\alias{print.summary.crrQR}

\title{Summary method for crrQR}
\description{
generate and print summaries of crrQR output
}
\usage{
\method{summary}{crrQR}(object, conf.int = 0.95, digits =
max(options()$digits - 5, 2), ...)

\method{print}{summary.crrQR}(x, digits=max(options()$digits - 4, 3), ...)
}

\arguments{
  \item{object}{ an object of class crrQR (output from the crrQR function) }
  \item{conf.int}{the level for a two-sided confidence interval on the
    coefficients. Default is 0.95.}
  \item{digits}{ in \code{summary.crrQR}, \code{digits} determines the number of
  significant digits retained in the p-values.  In \code{print.summary.crrQR}, 
  \code{digits} sets the values of the \code{digits} option for printing
  the output.}
  \item{\dots}{ included for compatibility with the generic functions.  Not
    currently used. }
  \item{x}{an object of class summary.crrQR (output from the summary
  method for crrQR)}
}
\details{
  The summary method calculates the average effects, the variances 
  and p-values of the test on the effect beeing 0. Furthermore it performs 
  a test for constant coefficients. 
  The print method prints a fairly standard format tabular summary of the results.
}
\value{\code{summary.crrQR} returns a list of class summary.crrQR, which
  contains components
  \item{call }{the call to crr}
  \item{n }{the number of observations used in fitting the model}
  \item{n.missing }{the number of observations removed by \code{crr}
  from the input data due to missing values}
  \item{ave.eff }{vector of average effects of covariates }
  \item{var.ave.eff }{vector of corresponding variances }
  \item{p.signf.test }{p-values for testing average effect=0} 
  \item{cnst.test }{scores of test on constant effect} 
  \item{var.cnst.test }{variances of the score} 
  \item{p.cnst.test }{p-values for the test}
}
\seealso{ \code{\link{crrQR}}}
\examples{
## see examples in the crrQR help file
}
\keyword{survival}
