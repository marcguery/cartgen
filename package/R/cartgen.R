cartgen <- function(matrix, rnd=TRUE){
  newmat <- matrix
  ord <- c()
  class <- colnames(newmat)[length(newmat)]
  y <- unique(newmat[,class])[1]
  n <- unique(newmat[,class])[2]
  while (length(unique(newmat[,class]))==2) {
    gains <- list()
    for (col in colnames(newmat)[c(-1, -length(newmat))]) {
      recf <- unique(newmat[[col]])[1]
      recs <- unique(newmat[[col]])[2]
      zeroY = sum(newmat[[col]]==recf & newmat[[class]]==y)
      zeroN = sum(newmat[[col]]==recf & newmat[[class]]==n)
      oneY = sum(newmat[[col]]==recs & newmat[[class]]==y)
      oneN = sum(newmat[[col]]==recs & newmat[[class]]==n)
      gains[[col]] = gain(zeroY, zeroN, oneY, oneN)
    }
    gains <- gains[!is.na(gains)]
    if(length(gains)==0){
      cat(" CART tree has terminated in an unresolved state : ")
      cat(paste("'", as.character(newmat[[class]]), "'", sep=""))
      cat("\n")
      break
    }
    poss <- names(which(unlist(gains) == max(unlist(gains))))
    if (!rnd & length(poss)>1) {
      cat("Choose a node among : ")
      cat(poss)
      best <- readLines(stdin(),1)
      if (!best%in%poss) {
        cat(best)
        cat(" is not a correct node.")
        cat("\n")
        next
      }
    }
    else{
      best <- sample(poss, 1)
    }
    cat(paste("Next node is", best))
    cat("\n")
    ord <- c(ord, best)
    recf <- as.character(unique(newmat[[best]])[1])
    recs <- as.character(unique(newmat[[best]])[2])
    onemat <- newmat[newmat[[best]]==recf,]
    zeromat <- newmat[newmat[[best]]==recs,]
    if (length(unique(onemat[,class]))>1 & (length(unique(zeromat[,class]))>1)){
      if (!rnd){
        cat("Unresolved state, choose a branch :(")
        cat(recf)
        cat("/")
        cat(recs)
        cat(") ")
        sepa <- readLines(con=stdin(),1)
        if (!sepa%in%c(recs,recf)) {
          cat(sepa)
          cat(" is not a correct branch.")
          cat("\n")
          next
        }
        cat(paste(" You selected branch", sepa))
        cat("\n")
      }
      else{
        sepa <- sample(c(recf,recs), 1)
        cat(paste(" Randomly selected branch", sepa))
        cat("\n")
      }
      newmat <- newmat[newmat[[best]]==sepa,]
    }
    else{
      if (length(unique(onemat[,class]))==1){
        cat(paste(" Leaf is '", unique(onemat[,class]), "' with branch ", recf, sep=""))
        cat("\n")
        newmat <- zeromat
      }
      if (length(unique(zeromat[,class]))==1){
        cat(paste(" Leaf is '", unique(zeromat[,class]), "' with branch ", recs, sep=""))
        cat("\n")
        newmat <- onemat
      }
    }
    newmat <- newmat[,!colnames(newmat)==best]
  }
  return(ord)
}
