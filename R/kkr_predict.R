#' KRR 예측 함수
#'
#' @description krr_fit()으로 적합된 KRR 모델을 이용해 새로운 데이터의 예측값을 계산합니다.
#'
#' @param object krr 객체
#' @param X_new 새로운 입력값 (matrix)
#'
#' @return 예측값 벡터
#' @export

krr_predict <- function(object, X_new, ...) {
  X <- object$X
  n <- nrow(X)
  n_new <- nrow(X_new)

  K_new <- matrix(0, n_new, n)
  for (i in 1:n_new)
    for (j in 1:n)
      K_new[i, j] <- exp(-object$rho * sum((X_new[i, ] - X[j, ])^2))

  return(K_new %*% object$coefficients)
}
