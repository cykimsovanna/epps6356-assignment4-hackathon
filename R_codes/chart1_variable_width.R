library(ggplot2)

source("R_codes/cleaning_data.R")
source("R_codes/theme_settings.R")

# Summarize HPI and population by region
region_summary <- hpi_2025 |>
  dplyr::group_by(Region) |>
  dplyr::summarise(
    mean_hpi = mean(HPI, na.rm = TRUE),
    total_pop = sum(Population, na.rm = TRUE),
    .groups = "drop"
  ) |>
  dplyr::mutate(
    xmax = cumsum(total_pop),
    xmin = xmax - total_pop,
    xcenter = (xmin + xmax) / 2
  )

# Chart 1
chart1 <- ggplot(region_summary) +
  geom_rect(
    aes(
      xmin = xmin,
      xmax = xmax,
      ymin = 0,
      ymax = mean_hpi,
      fill = Region
    ),
    color = "white",
    linewidth = 0.5
  ) +
  scale_fill_manual(values = region_colors) +
  scale_x_continuous(
    labels = function(x) paste0(round(x / 1e6, 1), "B")
  ) +
  labs(
    title = "Larger Populations Do Not Necessarily Mean Higher HPI Scores in 2025",
    subtitle = "Column width represents total population; height represents average HPI score",
    x = "Cumulative Population (Billions)",
    y = "Average HPI Score",
    fill = "Region",
    caption = "Source: Happy Planet Index (2026 Release, Hot or Cool Institute)"
  ) +
  theme_labels

chart1