library(readxl)

hpi_data <- "data/Happy-Planet-Index-2006-2025-public-data-set.xlsx"
# excel_sheets(hpi_data)

hpi_all <- read_excel(
  hpi_data,
  sheet = "All Data",
  range = "A2:T3126" # rows and columns with the actual data, not labels or anything else
)

# names(hpi_all)
# dim(hpi_all)
# tail(hpi_all[, 1:20])

# sort(unique(hpi_all$Year))
# table(hpi_all$Year)

hpi_2025 <- subset(hpi_all, Year == 2025)
# nrow(hpi_2025)
# sum(is.na(hpi_2025$HPI))

hpi_2025$Region <- factor(
  hpi_2025$Continent,
  levels = 1:8,
  labels = c(
    "Latin America & Caribbean",
    "U.S., Canada & Oceania",
    "Western Europe",
    "Middle East & North Africa",
    "Sub-Saharan Africa",
    "South Asia",
    "Eastern Europe & Central Asia",
    "East & Southeast Asia"
  )
)

hpi_2025_no_na <- subset(hpi_2025, !is.na(HPI))
# nrow(hpi_2025_no_na)
# sum(is.na(hpi_2025_no_na$HPI))

