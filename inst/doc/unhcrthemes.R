## ----include = FALSE----------------------------------------------------------
library(ragg)
knitr::opts_chunk$set(
  message = FALSE,
  warning = FALSE,
  collapse = TRUE,
  comment = "#>",
  dev = "ragg_png",
  fig.retina = 2,
  dpi = 300,
  out.width = "100%"
)

## ----setup--------------------------------------------------------------------
# Load packages
library(ggplot2)
library(unhcrthemes)

# Load Lato
import_lato()

# Create some data
df <- data.frame(
  date = factor(rep(2010:2020, 2)),
  val = c(
    10.2, 10.2, 10.2, 11.5, 14,
    15.8, 17, 19.5, 20.5, 24.5, 20.6,
    4.9, 4.9, 4.9, 5.5, 5.5, 5.6,
    5.6, 5.7, 5.7, 5.8, 5.9
  ),
  set = rep(c("Set 1", "Set 2"), each = 11)
)

# Base plot with theme_unhcr()
ggplot(
  data = df,
  aes(x = date, y = val, fill = set)
) +
  geom_col(
    position = position_stack(reverse = TRUE),
    width = 0.8
  ) +
  labs(
    title = "My title | 2010-2020",
    subtitle = "My subtitle",
    x = "date",
    y = "values",
    caption = "Source: UNHCR, the UN Refugee Agency"
  ) +
  theme_unhcr()

## -----------------------------------------------------------------------------
ggplot(
  data = df,
  aes(x = date, y = val, fill = set)
) +
  geom_col(
    position = position_stack(reverse = TRUE),
    width = 0.8
  ) +
  labs(
    title = "My title | 2010-2020",
    subtitle = "My subtitle",
    x = "date",
    y = "values",
    caption = "Source: UNHCR, the UN Refugee Agency"
  ) +
  theme_unhcr(
    grid = "Y" # Only major Y grid lines
  )

## -----------------------------------------------------------------------------
ggplot(
  data = df,
  aes(x = date, y = val, fill = set)
) +
  geom_col(
    position = position_stack(reverse = TRUE),
    width = 0.8
  ) +
  labs(
    title = "My title | 2010-2020",
    subtitle = "My subtitle",
    x = "date",
    y = "values",
    caption = "Source: UNHCR, the UN Refugee Agency"
  ) +
  theme_unhcr(
    grid = "Y",
    axis = "X" # Only X axis
  )

## -----------------------------------------------------------------------------
ggplot(
  data = df,
  aes(x = date, y = val, fill = set)
) +
  geom_col(
    position = position_stack(reverse = TRUE),
    width = 0.8
  ) +
  labs(
    title = "My title | 2010-2020",
    subtitle = "My subtitle",
    x = "date",
    y = "values",
    caption = "Source: UNHCR, the UN Refugee Agency"
  ) +
  scale_y_continuous(
    expand = expansion(c(0, 0.01)) # Remove axis expansion
  ) +
  theme_unhcr(
    grid = "Y",
    axis = "X"
  )

## -----------------------------------------------------------------------------
ggplot(
  data = df,
  aes(x = date, y = val, fill = set)
) +
  geom_col(
    position = position_stack(reverse = TRUE),
    width = 0.8
  ) +
  labs(
    title = "My title | 2010-2020",
    subtitle = "My subtitle",
    y = "values",
    caption = "Source: UNHCR, the UN Refugee Agency"
  ) +
  scale_y_continuous(
    expand = expansion(c(0, 0.01))
  ) +
  theme_unhcr(
    grid = "Y",
    axis = "X",
    axis_title = "Y" # Only Y axis title
  )

## ----fig.height=5.5-----------------------------------------------------------
ggplot(
  data = df,
  aes(x = date, y = val, fill = set)
) +
  geom_col(
    position = position_stack(reverse = TRUE),
    width = 0.8
  ) +
  labs(
    # Add some HTML style to the title
    title = "My title including <span style='color:#0072BC;'>highlight color</span> | 2010-2020",
    # Automatic wrapping of long text
    subtitle = "My really long subtitle that will cover more than one line and that will be automatically wrapped thanks to ggtext so I don't have to manually put a line break",
    y = "values",
    # Line break in the caption, use <br> instead of \n
    caption = "Note: As it's HTML text the line break symbol is not '\\n'<br>Source: UNHCR, the UN Refugee Agency"
  ) +
  scale_y_continuous(
    expand = expansion(c(0, 0.01))
  ) +
  theme_unhcr(
    grid = "Y",
    axis = "X",
    axis_title = "Y"
  )

## ----fig.height=5.5-----------------------------------------------------------
ggplot(
  data = df,
  aes(x = date, y = val, fill = set)
) +
  geom_col(
    position = position_stack(reverse = TRUE),
    width = 0.8
  ) +
  # Add geom_text
  geom_text(aes(label = scales::number_format(accuracy = 0.1)(val)),
    position = position_stack(vjust = 0.5, reverse = TRUE),
    show.legend = FALSE
  ) +
  labs(
    title = "My title including <span style='color:#0072BC;'>highlight color</span> | 2010-2020",
    subtitle = "My really subtitle that will cover more than one line and that will be automatically wrapped thanks to ggtext so I don't have to manually put a line break",
    y = "values",
    caption = "Note: As it's HTML text the line break symbol is not '\\n'<br>Source: UNHCR, the UN Refugee Agency"
  ) +
  scale_y_continuous(
    expand = expansion(c(0, 0.01))
  ) +
  theme_unhcr(
    grid = "Y",
    axis = "X",
    axis_title = "Y"
  )

## ----fig.height=5.5-----------------------------------------------------------
ggplot(
  data = df,
  aes(x = date, y = val, fill = set)
) +
  geom_col(
    position = position_stack(reverse = TRUE),
    width = 0.8
  ) +
  labs(
    title = "My title including <span style='color:#0072BC;'>highlight color</span> | 2010-2020",
    subtitle = "My really subtitle that will cover more than one line and that will be automatically wrapped thanks to ggtext so I don't have to manually put a line break",
    y = "values",
    caption = "Note: As it's HTML text the line break symbol is not '\\n'<br>Source: UNHCR, the UN Refugee Agency"
  ) +
  scale_y_continuous(
    expand = expansion(c(0, 0.01))
  ) +
  scale_fill_unhcr_d() +
  theme_unhcr(
    grid = "Y",
    axis = "X",
    axis_title = "Y"
  )

## -----------------------------------------------------------------------------
ggplot(
  data = dplyr::filter(df, date == 2020),
  aes(x = date, y = val, fill = set)
) +
  geom_col(
    position = position_stack(reverse = TRUE),
    width = 0.8
  ) +
  labs(
    title = "My title | 2020",
    subtitle = "My subtitle",
    y = "values",
    caption = "Source: UNHCR, the UN Refugee Agency"
  ) +
  scale_fill_unhcr_d() +
  coord_polar(
    theta = "y",
    direction = -1
  ) +
  theme_unhcr(
    void = TRUE # Remove all grid lines, ticks, and axes
  )

