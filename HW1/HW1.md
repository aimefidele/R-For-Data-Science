HW1: Import data from statistical packages and database management
systems
================
Aime
2026-10-30

## Introduction

Data comes in many formats. In this homework I import data from a text
file, Excel, SPSS, Stata, SAS and a database, using the right package
for each.

## Packages

| Package       | Used for                  |
|---------------|---------------------------|
| readxl        | Excel files               |
| haven         | SPSS, Stata and SAS files |
| DBI + RSQLite | Databases                 |

``` r
library(readxl)
library(haven)
library(DBI)
```

## 1. Text file (CSV)

``` r
csv_data <- read.csv("data/iris.csv")
head(csv_data)
```

    ##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ## 1          5.1         3.5          1.4         0.2  setosa
    ## 2          4.9         3.0          1.4         0.2  setosa
    ## 3          4.7         3.2          1.3         0.2  setosa
    ## 4          4.6         3.1          1.5         0.2  setosa
    ## 5          5.0         3.6          1.4         0.2  setosa
    ## 6          5.4         3.9          1.7         0.4  setosa

## 2. Excel

``` r
excel_data <- read_excel("data/mtcars.xlsx")
head(excel_data)
```

    ## # A tibble: 6 × 11
    ##     mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
    ##   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
    ## 1  21       6   160   110  3.9   2.62  16.5     0     1     4     4
    ## 2  21       6   160   110  3.9   2.88  17.0     0     1     4     4
    ## 3  22.8     4   108    93  3.85  2.32  18.6     1     1     4     1
    ## 4  21.4     6   258   110  3.08  3.22  19.4     1     0     3     1
    ## 5  18.7     8   360   175  3.15  3.44  17.0     0     0     3     2
    ## 6  18.1     6   225   105  2.76  3.46  20.2     1     0     3     1

## 3. SPSS

``` r
spss_data <- read_sav("data/cars.sav")
head(spss_data)
```

    ## # A tibble: 6 × 2
    ##   speed  dist
    ##   <dbl> <dbl>
    ## 1     4     2
    ## 2     4    10
    ## 3     7     4
    ## 4     7    22
    ## 5     8    16
    ## 6     9    10

## 4. Stata

``` r
stata_data <- read_dta("data/mtcars.dta")
head(stata_data)
```

    ## # A tibble: 6 × 11
    ##     mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
    ##   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
    ## 1  21       6   160   110  3.9   2.62  16.5     0     1     4     4
    ## 2  21       6   160   110  3.9   2.88  17.0     0     1     4     4
    ## 3  22.8     4   108    93  3.85  2.32  18.6     1     1     4     1
    ## 4  21.4     6   258   110  3.08  3.22  19.4     1     0     3     1
    ## 5  18.7     8   360   175  3.15  3.44  17.0     0     0     3     2
    ## 6  18.1     6   225   105  2.76  3.46  20.2     1     0     3     1

## 5. SAS

``` r
sas_data <- read_xpt("data/cars.xpt")
head(sas_data)
```

    ## # A tibble: 6 × 2
    ##   speed  dist
    ##   <dbl> <dbl>
    ## 1     4     2
    ## 2     4    10
    ## 3     7     4
    ## 4     7    22
    ## 5     8    16
    ## 6     9    10

## 6. Database (SQLite)

``` r
con <- dbConnect(RSQLite::SQLite(), "data/school.sqlite")
dbListTables(con)
```

    ## [1] "students"

``` r
db_data <- dbGetQuery(con, "SELECT * FROM students")
db_data
```

    ##    name score
    ## 1  Aime    78
    ## 2 Grace    85
    ## 3  Eric    62
    ## 4 Diane    90

``` r
dbDisconnect(con)
```

## Conclusion

Base R reads CSV files, `readxl` reads Excel, `haven` reads SPSS, Stata
and SAS, and `DBI` connects R to databases so data can be imported with
SQL.
