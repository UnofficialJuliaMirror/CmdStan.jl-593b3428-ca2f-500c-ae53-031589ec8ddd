functions {
  real model_specific_function(real a){
    return a;
  }
  #include my_functions.stan


}

data {
  int<lower=1> N;
  int<lower=0,upper=1> y[N];
}
parameters {
  real<lower=0,upper=1> theta;
}
model {
  real alpha;
  real beta;
  alpha = model_specific_function(1);
  beta = my_function(1);
  y ~ bernoulli(theta);
}
