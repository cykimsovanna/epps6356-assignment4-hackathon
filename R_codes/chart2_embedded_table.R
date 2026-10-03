library(gt)
library(gtExtras)

source("R_codes/cleaning_data.R")
source("R_codes/theme_settings.R")

# Keep countries with complete data for all four indicators
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

# Sort by population and select the 20 most populous
table_2025 <- table_2025[
  order(-table_2025$Population),
]

table_2025 <- head(table_2025, 20)

# Keep variables displayed in the table
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

# Base table
chart2 <- table_2025 |>
  gt() |>
  tab_header(
    title = "Wellbeing and Ecological Outcomes Vary Across the 20 Most Populous Countries",
  ) |>
  fmt_number(
    columns = Population,
    scale_by = 1 / 1000,
    decimals = 1
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

# HPI embedded bars
chart2 <- chart2 |>
  gtExtras::gt_plt_bar(
    column = HPI,
    color = "steelblue",
    scale_type = "number",
    accuracy = 0.1,
    width = 120
  )

# Ecological Footprint embedded bars
chart2 <- chart2 |>
  gtExtras::gt_plt_bar(
    column = `Ecological Footprint`,
    color = "seagreen4",
    scale_type = "number",
    accuracy = 0.1,
    width = 100
  )

# Life Satisfaction embedded bars
chart2 <- chart2 |>
  gtExtras::gt_plt_bar(
    column = `Life Satisfaction`,
    color = "goldenrod1",
    scale_type = "number",
    accuracy = 0.1,
    width = 100
  )

chart2