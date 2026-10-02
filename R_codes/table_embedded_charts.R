library(gt)
library(gtExtras)

source("R_codes/cleaning_data.R")
source("R_codes/theme_settings.R")

table_2025 <- hpi_2025[
  complete.cases(
    hpi_2025[, c(
      "HPI",
      "Life Satisfaction",
      "Life Expectancy",
      "Ecological Footprint"
    )]
  ),
]

table_2025 <- table_2025[
  order(-table_2025$Population),
]

table_2025 <- head(table_2025, 20)

table_2025 <- table_2025[
  ,
  c(
    "Country",
    "Population",
    "Life Expectancy",
    "Life Satisfaction",
    "HPI",
    "Ecological Footprint"
  )
]

table_2025

table_embedded_chart <- table_2025 |>
  gt() |>
  tab_header(
    title = "Wellbeing and Ecological Indicators for the 20 Most Populous Countries in 2025",
  ) |>
  
  # Population is stored in thousands, so convert display to millions
  fmt_number(
    columns = Population,
    scale_by = 1 / 1000,
    decimals = 1,
  ) |>
  
  fmt_number(
    columns = c(
      `Life Expectancy`,
      `Life Satisfaction`,
      HPI,
      `Ecological Footprint`
    ),
    decimals = 1
  ) |>
  
  cols_label(
    Population = "Population (in millions)"
  )

table_embedded_chart

table_embedded_chart <- table_embedded_chart |>
  gtExtras::gt_plt_bar(
    column = HPI,
    color = "steelblue",
    scale_type = "number",
    accuracy = 0.1,
    width = 120
  )

table_embedded_chart <- table_embedded_chart |>
  gtExtras::gt_plt_bar(
    column = `Ecological Footprint`,
    color = "seagreen4",
    scale_type = "number",
    accuracy = 0.1,
    width = 100
  )

table_embedded_chart
