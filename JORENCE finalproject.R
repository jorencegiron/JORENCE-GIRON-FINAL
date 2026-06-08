library(ggplot2)
library(dplyr)
library(palmerpenguins)

data("penguins")

penguins_clean <- penguins %>% na.omit()

correlation_plot <- ggplot(
  penguins_clean,
  aes(
    x = bill_length_mm, y = flipper_length_mm,
    color = species, shape = island
  )
) +
  geom_point(size = 3, alpha = 0.8) +
  geom_smooth(method = "lm", se = TRUE,
              color = "#333333", linewidth = 1) +
  scale_color_manual(
    values = c(
      "Adelie"    = "#AEC6CF",   # Pastel Blue
      "Chinstrap" = "#FFD1DC",   # Pastel Pink
      "Gentoo"    = "#B5EAD7"    # Pastel Mint
    )
  ) +
  labs(
    title    = "Correlation Between Bill Length and Flipper Length",
    subtitle = "Penguin Biometric Trend Analysis",
    x        = "Bill Length (mm)",
    y        = "Flipper Length (mm)",
    color    = "Species",
    shape    = "Island"
  ) +
  theme_classic() +
  theme(
    plot.title        = element_text(size = 18, face = "bold",
                                     hjust = 0.5, color = "#2E2E2E"),
    plot.subtitle     = element_text(size = 12, hjust = 0.5,
                                     color = "#555555"),
    axis.title        = element_text(size = 12, face = "bold",
                                     color = "#2E2E2E"),
    axis.text         = element_text(size = 10, color = "#444444"),
    legend.position   = "right",
    legend.background = element_rect(fill = "#F7F7F7", color = NA),
    panel.background  = element_rect(fill = "#FAFAFA", color = NA),
    plot.background   = element_rect(fill = "#FFFFFF", color = NA)
  )

print(correlation_plot)

ggsave(
  "penguin_correlation.png",
  plot = correlation_plot, width = 12, height = 8, dpi = 300
)

# Interpretation
# There is a positive correlation between bill length
# and flipper length among penguins.
# Gentoo penguins tend to have larger measurements,
# while Adelie penguins cluster at smaller dimensions.
# Different island groups show overlapping but distinct patterns.