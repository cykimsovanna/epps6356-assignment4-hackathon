library(ggplot2)

source("R_codes/cleaning_data.R")
source("R_codes/theme_settings.R")

# Average ecological footprint by region
footprint_region <- aggregate(
  `Ecological Footprint` ~ Region,
  data = hpi_2025,
  FUN = mean
)

# Chart 4
chart4 <- ggplot(
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
    title = "The West Has the Largest Average Ecological Footprints in 2025",
    x = NULL,
    y = "Ecological Footprint (gha)",
    fill = "Region",
    caption = "Source: Happy Planet Index 2006–2025 public dataset"
  ) +
  theme_labels +
  theme(
    axis.text.x = element_text(
      angle = 25,
      hjust = 1,
      vjust = 1
    ),
    legend.position = "none",
    plot.margin = margin(10, 10, 10, 25)
  )

chart4