HW3: Functions and the apply family
================
Aime Fidele Iradukunda (20252MBI010)

## Q1. Summary statistics

``` r
summary_stats <- function(values) {
  c(n = sum(!is.na(values)), mean = mean(values, na.rm = TRUE),
    median = median(values, na.rm = TRUE), sd = sd(values, na.rm = TRUE),
    min = min(values, na.rm = TRUE), max = max(values, na.rm = TRUE))
}

summary_stats(mtcars$mpg)
```

    ##         n      mean    median        sd       min       max 
    ## 32.000000 20.090625 19.200000  6.026948 10.400000 33.900000

## Q2. Two sample t test

``` r
t_test_two <- function(group1, group2) {
  se1 <- var(group1) / length(group1)
  se2 <- var(group2) / length(group2)
  t_stat <- (mean(group1) - mean(group2)) / sqrt(se1 + se2)
  df <- (se1 + se2)^2 / (se1^2/(length(group1)-1) + se2^2/(length(group2)-1))
  p_val <- 2 * pt(-abs(t_stat), df)
  list(t = t_stat, df = df, p_value = p_val)
}

manual_mpg <- mtcars$mpg[mtcars$am == 1]
auto_mpg   <- mtcars$mpg[mtcars$am == 0]

t_test_two(manual_mpg, auto_mpg)
```

    ## $t
    ## [1] 3.767123
    ## 
    ## $df
    ## [1] 18.33225
    ## 
    ## $p_value
    ## [1] 0.001373638

``` r
t.test(manual_mpg, auto_mpg)
```

    ## 
    ##  Welch Two Sample t-test
    ## 
    ## data:  manual_mpg and auto_mpg
    ## t = 3.7671, df = 18.332, p-value = 0.001374
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##   3.209684 11.280194
    ## sample estimates:
    ## mean of x mean of y 
    ##  24.39231  17.14737

## Q3. The apply family

``` r
# lapply: runs mean on each column, gives a list
lapply(mtcars[, c("mpg", "hp")], mean)
```

    ## $mpg
    ## [1] 20.09062
    ## 
    ## $hp
    ## [1] 146.6875

``` r
# sapply: same as lapply, but gives a simple vector
sapply(mtcars[, c("mpg", "hp")], mean)
```

    ##       mpg        hp 
    ##  20.09062 146.68750

``` r
# tapply: splits mpg into groups by cyl, then finds the mean of each group
tapply(mtcars$mpg, mtcars$cyl, mean)
```

    ##        4        6        8 
    ## 26.66364 19.74286 15.10000

``` r
# mapply: adds the first pair, then the second pair, then the third pair
mapply(function(a, b) a + b, 1:3, 4:6)
```

    ## [1] 5 7 9

``` r
# apply: 2 = columns, so max of each column
apply(mtcars[, 1:3], 2, max)
```

    ##   mpg   cyl  disp 
    ##  33.9   8.0 472.0

``` r
# apply: 1 = rows, so sum of each row
apply(mtcars[1:5, 1:3], 1, sum)
```

    ##         Mazda RX4     Mazda RX4 Wag        Datsun 710    Hornet 4 Drive 
    ##             187.0             187.0             134.8             285.4 
    ## Hornet Sportabout 
    ##             386.7

## References

- Peng, R. D. (2016). *R Programming for Data Science*. Leanpub.
  Chapter: Loop Functions.
  <https://bookdown.org/rdpeng/rprogdatascience/>
