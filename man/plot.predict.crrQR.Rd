\name{plot.predict.crrQR}
\alias{plot.predict.crrQR}
\title{
Plot estimated subdistribution functions
}
\description{
plot method for \code{predict.crrQR}
}
\usage{
\method{plot}{predict.crrQR}(x, lty=1:(ncol(x)-1), color=1,  
ylim=c(0, max(x[, -1])), xmin=0, xmax=max(x[, 1]), \dots)
}
\arguments{
\item{x}{
output from \code{predict.crrQR}
}
\item{lty}{
vector of line types. If length is \eqn{<}{<} \# curves, then
\code{lty[1]} is used for all. 
}
\item{color}{
vector of line colors.  If length is \eqn{<}{<} \# curves, then
\code{color[1]} is used for all. 
}
\item{ylim}{
range of y-axis (vector of length two)
}
\item{xmin}{
lower limit of x-axis (often 0, the default)
}
\item{xmax}{
upper limit of x-axis
}
\item{...}{
other arguments to plot
}}
\section{Side Effects}{
plots the subdistribution functions estimated by \code{predict.crrQR}, by
default using a different line type for each curve
}
\seealso{
\code{\link{crrQR}} \code{\link{predict.crrQR}}
}
\keyword{survival}
