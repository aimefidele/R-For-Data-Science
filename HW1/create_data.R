# Creates example data files in different formats for HW1
#install.packages(c("haven", "readxl", "writexl", "DBI", "RSQLite"))

library(haven)
library(writexl)
library(DBI)

dir.create("data")

write.csv(iris, "data/iris.csv", row.names = FALSE)   # text file (CSV)
write_xlsx(mtcars, "data/mtcars.xlsx")                # Excel
write_sav(cars, "data/cars.sav")                      # SPSS
write_dta(mtcars, "data/mtcars.dta")                  # Stata
write_xpt(cars, "data/cars.xpt")                      # SAS

con <- dbConnect(RSQLite::SQLite(), "data/school.sqlite")   # database
dbWriteTable(con, "students", data.frame(
  name  = c("Aime", "Grace", "Eric", "Diane"),
  score = c(78, 85, 62, 90)))
dbDisconnect(con)