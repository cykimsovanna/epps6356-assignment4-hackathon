library(ggplot2)

source("R_codes/cleaning_data.R")
source("R_codes/theme_settings.R")

region_population <- aggregate(
  Population ~ Region,
  data = hpi_2025,
  FUN = sum
)

region_hpi <- aggregate(
  HPI ~ Region,
  data = hpi_2025_no_na,
  FUN = mean
)

chart1_data <- merge(
  region_population,
  region_hpi,
  by = "Region"
)

chart1_data
