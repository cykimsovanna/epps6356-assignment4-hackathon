# 1. Summarize region metrics
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

# 2. Build Chart 1
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
  # Updated to divide by 1e9 for Billions:
  scale_x_continuous(
    labels = function(x) paste0(round(x / 1e6, 1), "B")
  ) +
  labs(
    title = "Regional Happy Planet Index vs. Population Size (2025)",
    subtitle = "Column width represents total population; height represents mean HPI score",
    x = "Cumulative Population (Billions)",
    y = "Mean Happy Planet Index (HPI)",
    fill = "Region",
    caption = "Source: Happy Planet Index (2026 Release, Hot or Cool Institute)"
  ) +
  theme_labels