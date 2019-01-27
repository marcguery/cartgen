gini <- function(a, b){
  c = 1 - (a/(a+b))^2 - (b/(a+b))^2
  return(c)
}

gain <- function(a1, a2, b1, b2){
  tot=a1+a2+b1+b2
  moymin=round(tot/2)
  gain=gini(moymin, tot-moymin) - ((a1+a2)/tot)*gini(a1, a2) - ((b1+b2)/tot)*gini(b1, b2)
  return(gain)
}
