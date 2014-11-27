\name{crrQR}
\alias{crrQR}
\alias{print.crrQR}
\title{
Competing Risks Quantile Regression
}
\description{
quantile regression modeling of subdistribution functions in competing risks
}
\usage{
crrQR(ftime, fstatus, X, failcode=1, cencode=0, 
tau.range=c(0.01,0.99), tau.step=0.01, subset, 
na.action=na.omit, rq.method="br", variance=TRUE)

\method{print}{crrQR}(x, ...)
}
\arguments{
\item{ftime}{
vector of failure/censoring times
}
\item{fstatus}{
vector with a unique code for each failure type and a separate code for
censored observations 
}
\item{X}{
matrix (nobs x ncovs) of covariates
}
\item{failcode}{
code of fstatus that denotes the failure type of interest
}
\item{cencode}{
code of fstatus that denotes censored observations
}
\item{tau.range}{
vector of length 2 denoting the range of quantiles
}
\item{tau.step}{
grid size on tau.range (spacing between two grid points)
}
\item{subset}{
  a logical vector specifying a subset of cases to include in the
  analysis
}
\item{na.action}{
  a function specifying the action to take for any cases missing any of
  ftime, fstatus, cov1, cov2, cengroup, or subset.
}
\item{rq.method}{
  method of computation for quantile regressions. (cf. documentation of method 
  \code{\link[quantreg]{rq.fit}} in package quantreg for details.)
}
\item{variance}{
  if \code{FALSE}, then suppresses computation of asymptotic variances 
}
\item{x}{
crrQR object (output from \code{crrQR()}) for method print
}
\item{\dots}{ included for compatibility with the generic functions.  Not
    currently used. }
}
\value{
  Returns a list of class crrQR, with components
\item{$beta.seq}{the estimated regression coefficients}
\item{$tau.seq}{the sequence of quantiles computed}
\item{$var.seq}{estimated variance covariance matrix of coef}
\item{$inf.func}{list of estimated influence functions}
\item{$call}{the call to crr}
\item{$n}{the number of observations used in fitting the model}
\item{$n.missing}{the number of observations removed from the input data
  due to missing values}
\item{$cvt.length}{number of covariates (columns of X)}
}
\details{
Fits the competing risks quantile regression model described in Peng and Fine (2009).

While the use of model formulas is not supported, the
\code{model.matrix} function can be used to generate suitable matrices
of covariates from factors, eg
\code{model.matrix(~factor1+factor2)[,-1]} will generate the variables
for the factor coding of the factors \code{factor1} and \code{factor2}.
The final \code{[,-1]} removes the constant term from the output of
\code{model.matrix}.

If \code{variance=FALSE}, then %\code{predict.crr} cannot be used and
some of the functionality in \code{summary.crrQR} and \code{print.crrQR}
will be lost.  This option can be useful in situations where crrQR is
called repeatedly for point estimates, but standard errors are not
required, such as in bootstrapping the cumulative incidence function for 
confidence intervals.

The print method prints the estimated coefficients, the estimated standard errors, 
and the two-sided p-values for the test of the individual coefficients equal to 0.

A first implementation of the estimation procedure was prepared by Limin Peng and Ruosha Li.
}
\references{
Peng L and Fine JP (2009) Competing risks quantile regression. JASA 104:1440-1453.
}
\seealso{
\code{\link{predict.crrQR}} \code{\link{plot.predict.crrQR}}
\code{\link{summary.crrQR}} \code{\link[quantreg]{rq.fit}}
}
\examples{
# simulated data to test 
set.seed(10)
ftime <- rexp(200)
fstatus <- sample(0:2,200,replace=TRUE)
X <- matrix(runif(600),nrow=200)
dimnames(X)[[2]] <- c('x1','x2','x3')
#compute model
print(z <- crrQR(ftime,fstatus,X))
summary(z)
# predict and plot cumulative incedences
reference <- as.matrix(rbind(c(.1,.5,.8),c(.1,.5,.2)))
dimnames(reference)[[2]] <- c('x1','x2','x3') 
z.p <- predict(z,reference)
print(z.p)
plot(z.p,lty=1,color=2:3)
crrQR(ftime,fstatus,X,failcode=2)
}
\keyword{survival}
