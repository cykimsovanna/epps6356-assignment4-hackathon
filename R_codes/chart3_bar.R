library(ggplot2)

source("R_codes/cleaning_data.R")
source("R_codes/theme_settings.R")

# Sort 2025 countries by HPI
hpi_2025_sorted <- hpi_2025_no_na[
  order(hpi_2025_no_na$HPI),
]

# Select the top and bottom 20
hpi_2025_sorted_top20 <- tail(
  hpi_2025_sorted,
  20
)

hpi_2025_sorted_bottom20 <- head(
  hpi_2025_sorted,
  20
)

hpi_2025_top_bottom20 <- rbind(
  hpi_2025_sorted_top20,
  hpi_2025_sorted_bottom20
)

# Chart 3
chart3 <- ggplot(
  hpi_2025_top_bottom20,
  aes(
    x = HPI,
    y = forcats::fct_reorder(Country, HPI),
    fill = Region
  )
) +
  geom_col(width = 0.8) +
  geom_hline(
    yintercept = 20.5,
    linetype = "dotted",
    color = "black",
    linewidth = 0.5
  ) +
  scale_fill_manual(values = region_colors) +
  labs(
    title = "Latin America & Caribbean Accounts for Half of the 2025 HPI Top 20",
    subtitle = "The dotted line separates the 20 highest- and lowest-scoring countries",
    x = "HPI score",
    y = NULL,
    fill = "Region",
    caption = "Source: Happy Planet Index 2006–2025 public dataset"
  ) +
  theme_labels +
  annotate(
    "text",
    x = 72,
    y = 21.5,
    label = "Top 20",
    hjust = 1,
    family = "inter",
    size = 3
  ) +
  annotate(
    "text",
    x = 72,
    y = 19.5,
    label = "Bottom 20",
    hjust = 1,
    family = "inter",
    size = 3
  )

chart3