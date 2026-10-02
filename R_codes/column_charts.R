library(ggplot2)

source("R_codes/cleaning_data.R")
source("R_codes/theme_settings.R")

footprint_region <- aggregate(
  `Ecological Footprint` ~ Region,
  data = hpi_2025,
  FUN = mean
)

ggplot(
  footprint_region,
  aes(
    x = reorder(Region, -`Ecological Footprint`),
    y = `Ecological Footprint`,
    fill = Region
  )
) +
  geom_col(width = 0.65) +
  scale_fill_manual(values = region_colors) +
  labs(
    title = "Average Ecological Footprint by Region in 2025",
    x = NULL,
    y = "Ecological Footprint (gha)",
    fill = "Region",
    caption = "Source: Happy Planet Index 2006–2025 public dataset"
  ) +
  theme_labels +
  theme(
    axis.text.x = element_text(angle = 30, hjust = 1),
    legend.position = "none"
  )

