library(ggplot2)
library(showtext)

region_colors <- c(
  "Latin America & Caribbean" = "goldenrod1",
  "U.S., Canada & Oceania" = "dodgerblue1",
  "Western Europe" = "royalblue4",
  "Middle East & North Africa" = "plum1",
  "Sub-Saharan Africa" = "firebrick3",
  "South Asia" = "forestgreen",
  "Eastern Europe & Central Asia" = "paleturquoise3",
  "East & Southeast Asia" = "grey26"
)

font_add_google("Quattrocento", "quattrocento")
font_add_google("Inter", "inter")
showtext_auto()

theme_labels <- theme_minimal(base_family = "inter", base_size = 13) +
  theme(
    plot.title = element_text(
      family = "quattrocento",
      face = "bold",
      size = 22,
      margin = margin(b = 6)
    ),
    
    plot.subtitle = element_text(
      family = "quattrocento",
      size = 14,
      margin = margin(b = 10)
    ),
    
    plot.caption = element_text(
      family = "inter",
      size = 10,
      color = "gray40",
      margin = margin(t = 8)
    ),
    
    axis.title = element_text(
      family = "quattrocento",
      face = "bold",
      size = 13
    ),
    
    axis.text = element_text(
      family = "inter",
      size = 11
    ),
    
    legend.title = element_text(
      family = "quattrocento",
      face = "bold",
      size = 12
    ),
    
    legend.text = element_text(
      family = "inter",
      size = 10
    ),
    
    panel.grid.minor = element_blank(),
    legend.position = "right"
  )