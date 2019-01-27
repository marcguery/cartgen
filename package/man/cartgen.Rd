\name{cartgen}
\alias{cartgen}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
CART tree generator
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
This tool generates a CART tree given a specific well-formated binary matrix. At each step, the node having the maximum Gini-based gain is chosen. If this node lead to a leaf from one or both of its branches, the class corresponding to this leaf is given. This process continues until reaching a node with two leafs.
}
\usage{
cartgen(matrix, rnd=TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{matrix}{
%%     ~~Describe \code{x} here~~
      The first column of the matrix contains indices of the individuals. The last column contains the classes of the corresponding individual of the database. The intermediate columns are represented by all the potential nodes of the CART tree. This matrix must be binary for each column (except for the first one) and string formatted.}
  \item{rnd}{
        Optionnal, default is TRUE.
        Wether or not let the algorithm randomly choose :
        a node when two or more have the maximum gain,
        or a branch when a node does not have any leaf.
      }

}
\details{
%%  ~~ If necessary, more details than the description above ~~
    If a CART tree terminates in an undetermined state, i. e. no choice between a class or the other can ever be made, the last leaf gives the user the list of remaining classes.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
Returns the list of the nodes from top to bottom of the tree.
}
\references{
%% ~put references to the literature/web site here ~
http://www.academia.edu/7032069/An_example_of_calculating_gini_gain_in_CART
}
\author{
%%  ~~who you are~~
Marc-Antoine Guery
}
\note{
%%  ~~further notes~~
}

\section{Warning}{The user input does not work properly with the command `Rscript`. Hence, use rnd=TRUE when launching the script with the command `Rscript`.}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##Examples of matrices
#The first one lead to an undetermined state (1 'o' and 1 'n')
mat1 <- as.data.frame(matrix(c(1, 0, 0, 0, 1, 0, "o",
                               1, 0, 0, 0, 1, 0, "o",
                               2, 0, 1, 1, 1, 0, "o",
                               2, 0, 1, 1, 1, 0, "o",
                               3, 0, 0, 0, 0, 0, "o",
                               4, 0, 0, 1, 1, 0, "n",
                               4, 0, 0, 1, 1, 0, "n",
                               4, 0, 0, 1, 1, 0, "n",
                               6, 0, 0, 0, 0, 0, "n",
                               9, 1, 0, 0, 0, 1, "n"), ncol=7, byrow = T))
#The second one have a node with no leaf
mat2 <- as.data.frame(matrix(c(1, 0, 0, 0, 1, 0, "o",
                               1, 0, 0, 0, 1, 0, "o",
                               4, 0, 0, 1, 1, 0, "n",
                               5, 0, 1, 1, 1, 0, "n",
                               6, 0, 0, 0, 0, 0, "n",
                               6, 0, 0, 0, 0, 0, "n",
                               8, 1, 1, 0, 0, 1, "n",
                               9, 1, 0, 0, 0, 1, "n",
                               9, 1, 0, 0, 0, 1, "n",
                               10, 1, 0, 1, 0, 1, "o"), ncol=7, byrow = T))
#The user chooses which node/branch to explore
order <- cartgen(matrix=mat1, rnd=FALSE)
#The algorithm randomly chooses node/branch
order <- cartgen(matrix=mat1, rnd=TRUE)
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
}
