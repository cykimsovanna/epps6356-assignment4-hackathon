library(readxl)
library(ggplot2)

# Pulling the data
source("R_codes/cleaning_data.R")

hpi_2025_sorted <- hpi_2025_no_na[order(hpi_2025_no_na$HPI),]

hpi_2025_sorted_top20 <-tail(hpi_2025_sorted, 20)
hpi_2025_sorted_bottom20 <- head(hpi_2025_sorted, 20)

hpi_2025_top_bottom20 <- rbind(
  hpi_2025_sorted_top20,
  hpi_2025_sorted_bottom20
)

# Making the bar charts
source("R_codes/theme_settings.R")

ggplot(
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
    title = "HPI Scores of the Top and Bottom 20 Countries in 2025",
    x = "HPI score",
    y = NULL,
    fill = "Region",
    caption = "Source: Happy Planet Index 2006–2025 public dataset"
  ) +
  theme_labels



