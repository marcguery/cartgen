\name{gain}
\alias{gain}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Gini-based gain calculator
}
\description{
  This tool calculates the gain of a target attribute having two possible values regarding its ability to classify individuals into two classes.
}
\usage{
gain(a1, a2, b1, b2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{a1}{
  Integer greater or equal to 0.
  The number of elements of the first value corresponding to the first class.
}
\item{a2}{
Integer greater or equal to 0.
  The number of elements of the first value corresponding to the second class.
}
\item{b1}{
Integer greater or equal to 0.
  The number of elements of the second value corresponding to the first class.
}
\item{b2}{
Integer greater or equal to 0.
  The number of elements of the second value corresponding to the second class.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Returns the Gini-based gain of a target element.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Marc-Antoine Guery
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
gain(a1=1, a2=2, b1=4, b2=0)
}
