# HW1 – Importing Data into R

- **Student:** Aime Fidele Iradukunda
- **Registration number:** 20252MBI010
- **Programme:** MSc in Big Data Analytics
- **Course:** R for Data Science (MSDA9113)
- **Instructor:** Dr. Pacifique Nizeyimana
- **University:** Adventist University of Central Africa (AUCA)

## Assignment

Import data from statistical packages and from database management systems,
and show which R libraries can be used for each type of data.

## What I did

1. Installed the packages: `haven`, `readxl`, `writexl`, `DBI` and `RSQLite`.
2. Created example data files in different formats from R's built-in datasets
   (`iris`, `mtcars`, `cars`) using `create_data.R`.
3. Imported each file in `HW1.Rmd` and displayed the first rows to check the import.
4. Knitted `HW1.Rmd` to `HW1.md` to show the code and results.

## Data sources and libraries used

- **CSV file:** `iris.csv`, read with base R, `read.csv()`
- **Excel:** `mtcars.xlsx`, read with `readxl`, `read_excel()`
- **SPSS:** `cars.sav`, read with `haven`, `read_sav()`
- **Stata:** `mtcars.dta`, read with `haven`, `read_dta()`
- **SAS:** `cars.xpt`, read with `haven`, `read_xpt()`
- **Database (SQLite):** `school.sqlite`, read with `DBI` and `RSQLite`, `dbConnect()` and `dbGetQuery()`

## Files

- `create_data.R` – creates the data files
- `HW1.Rmd` – assignment code
- `HW1.md` – results (open this file to see the output)
- `data/` – data files

## How to run

1. Open `HW1.Rproj` in RStudio.
2. Run `create_data.R` once.
3. Open `HW1.Rmd` and click **Knit**.