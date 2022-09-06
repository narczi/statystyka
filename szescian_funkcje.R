szescian_2 <- function(x, y){
  x3 <- x^3
  y3 <- y^3
  return(c(x3,y3))
}

szescian_3 <- function(x=2, y=2){
  x3 <- x^3
  y3 <- y^3
  return(c(x3,y3))
}

szescian_4 <- function(x){
  if(!is.numeric(x)){
    stop("non-numeric argument x")
  }
  x^3
}