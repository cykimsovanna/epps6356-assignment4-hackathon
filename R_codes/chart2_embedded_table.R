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
    title = "Wellbeing and Ecological Outcomes Across the 20 Most Populous Countries"
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
    Country = "Country",
    Population = "Population (M)",
    `Life Expectancy` = "Life Exp. (years)",
    `Life Satisfaction` = "Life Satisfaction",
    HPI = "HPI",
    `Ecological Footprint` = "Footprint (gha)"
  )

# HPI embedded bars
chart2 <- chart2 |>
  gtExtras::gt_plt_bar(
    column = HPI,
    color = "steelblue",
    scale_type = "number",
    accuracy = 0.1,
    width = 50
  )

# Ecological Footprint embedded bars
chart2 <- chart2 |>
  gtExtras::gt_plt_bar(
    column = `Ecological Footprint`,
    color = "seagreen4",
    scale_type = "number",
    accuracy = 0.1,
    width = 65
  )

# Life Satisfaction embedded bars
chart2 <- chart2 |>
  gtExtras::gt_plt_bar(
    column = `Life Satisfaction`,
    color = "goldenrod1",
    scale_type = "number",
    accuracy = 0.1,
    width = 45
  )

# Compact table layout
chart2 <- chart2 |>
  cols_width(
    Country ~ px(90),
    Population ~ px(85),
    `Life Expectancy` ~ px(80),
    `Life Satisfaction` ~ px(130),
    HPI ~ px(120),
    `Ecological Footprint` ~ px(120)
  ) |>
  tab_source_note(
    source_note = "Source: Happy Planet Index 2006–2025 public dataset"
  ) |>
  tab_options(
    table.width = pct(100),
    table.font.size = px(10),
    data_row.padding = px(3),
    column_labels.padding = px(4),
    table.align = "center"
  )

chart2