library(ggplot2)
library(showtext)

region_colors <- c(
  "Latin America & Caribbean" = "goldenrod1",
  "U.S., Canada & Oceania" = "dodgerblue3",
  "Western Europe" = "royalblue4",
  "Middle East & North Africa" = "plum",
  "Sub-Saharan Africa" = "firebrick3",
  "South Asia" = "mediumpurple1",
  "Eastern Europe & Central Asia" = "seagreen4",
  "East & Southeast Asia" = "yellowgreen"
)

font_add_google("Quattrocento", "quattrocento")
font_add_google("Inter", "inter")
showtext_auto()

theme_labels <- theme_minimal(base_family = "inter") +
  theme(
    plot.title = element_text(
      family = "quattrocento",
      face = "bold",
      size = 18
    ),
    plot.subtitle = element_text(
      family = "quattrocento",
      size = 12
    ),
    plot.caption = element_text(
      size = 9,
      color = "gray40"
    ),
    axis.title = element_text(
      family = "quattrocento",
      face = "bold",
      size = 11
    ),
    panel.grid.minor = element_blank(),
    legend.title = element_text(
      family = "quattrocento",
      face = "bold"
    ),
    legend.position = "right"
  )