\name{gini}
\alias{gini}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Gini index calculator
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Calculates Gini index of a target attribute having two values.
}
\usage{
gini(a, b)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{a}{
%%     ~~Describe \code{x} here~~
    Integer greater or equal to 0.
    The number of elements of the first value.
}
 \item{b}{
    Integer greater or equal to 0.
    The number of elements of the second value.

 }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Returns the Gini index.
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
gini(a=2, b=5)
}
