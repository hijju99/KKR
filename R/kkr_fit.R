#' KRR 모델 적합 함수
#'
#' @description Gaussian kernel을 사용해 Kernel Ridge Regression(KRR)을 적합합니다.
#'
#' @param X 입력 데이터 (matrix)
#' @param y 반응값 (vector)
#' @param rho 커널 파라미터
#' @param lambda 페널티 파라미터
#'
#' @return krr 객체 (coefficients, fitted_values 등을 포함)
#' @export

krr_fit <- function(X, y, rho = 1, lambda = 0.0001) {
  n <- nrow(X)
  K <- matrix(0, n, n)

  for (i in 1:n)
    for (j in 1:n)
      K[i, j] <- exp(-rho * sum((X[i, ] - X[j, ])^2))

  alpha_hat <- solve(K + diag(lambda, n), y)

  out <- list(
    coefficients = alpha_hat,
    fitted_values = K %*% alpha_hat,
    X = X,
    y = y,
    rho = rho,
    lambda = lambda
  )
  class(out) <- "krr"
  return(out)
}
