\encoding{UTF-8}
\name{predict.crrQR}
\alias{predict.crrQR}
\title{
Estimate subdistribution functions from crrQR output
}
\description{
predict method for crrQR
}
\usage{
\method{predict}{crrQR}(object, x, rearrangement, ...)
}
\arguments{
\item{object}{
output from crrQR
}
\item{x}{
vector of covariate values for which the conditional distribution function is
to be estimated.  The columns of x must be named the same as in the original
call to crrQR.  Each must be given if present in the original call to crrQR.
}
\item{rearrangement}{
set rearrangement=TRUE to perform a rearrangement of the predicted probabilities
as suggested in Chernozhukov V, Fernández-Val I and Galichon A (2010).
}
\item{...}{
additional parameters (currently ignored).
}
}
\value{
Returns a matrix with the unique type 1 failure times in the first
column, and the other columns giving the estimated subdistribution
function corresponding to the covariate combinations in the rows of x,
at each failure time (the value that the estimate jumps to at
that failure time).
}
\details{
Computes the conditional estimate given values of covariates from
\eqn{sup(\tau: \tau \leq \zeta_{x,j}^{-1}[\ln(t)])}{sup(\tau: \tau \leq \zeta_(x,j)^(-1)[ln(t)])},
for \eqn{\zeta_{x,j}(\tau) = x'\beta_j(\tau)}{\zeta_(x,j)(\tau) = x'\beta_j(\tau)}
(see Dlugosz S, Lo S and Wilke RA (2014) for details)
}
\references{
Chernozhukov V, Fernández-Val I and Galichon A (2010) Quantile and probability
curves without crossing. Econometrica 78, 1093-1125.

Dlugosz S, Lo S, Wilke RA (2014) Competing risks quantile regression at work:
In-depth exploration of the role of public child support for
the duration of maternity leave. unpublished.
}
\seealso{
\code{\link{crrQR}} \code{\link{plot.predict.crrQR}}
}
\keyword{survival}


