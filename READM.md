# MyKRR Package

`MyKRR` 패키지는 Gaussian kernel 기반 Kernel Ridge Regression(KRR) 알고리즘을 제공합니다.  
아래는 간단한 회귀 데이터를 시뮬레이션하고, KRR을 이용해 적합 및 예측하는 과정입니다.

---

## 1. 데이터 시뮬레이션

```r
set.seed(1)
n <- 150
X <- matrix(runif(n, -1, 1), ncol = 1)

ftrue <- function(x) sin(2*pi*x) + 0.5*cos(4*pi*x)
y <- ftrue(X[,1]) + rnorm(n, sd = 0.1)
```

---

## 2. KRR 적합

```r
fit <- krr_fit(X, y, rho = 5, lambda = 0.001)
```

---

## 3. 새로운 입력값에서 예측

```r
X_new <- matrix(seq(-1, 1, length.out = 100), ncol = 1)
pred <- predict(fit, X_new)
```

---

위 과정은  
- 회귀 데이터를 생성하고  
- KRR 모델을 적합한 뒤  
- 새로운 데이터에 대한 예측을 수행하는 전체 흐름을 보여줍니다.
