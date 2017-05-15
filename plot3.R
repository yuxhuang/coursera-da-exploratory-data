source('./readData.R')

library(dplyr)
library(ggplot2)

plot3 <- function() {
  nei <- NEI %>%
    filter(fips == '24510') %>%
    group_by(year, type) %>%
    summarise(em = sum(as.numeric(Emissions)))

  r <- ggplot(nei, aes(year, em)) +
    geom_point(size = 3) +
    facet_grid(. ~ type) +
    geom_smooth(method = 'lm', se = FALSE) +
    labs(x = 'Year', y = 'Emission') +
    ggtitle('Emission by Type (Baltimore, Maryland)')
  
  print(r)
  
  dev.copy(png, 'plot3.png')
  dev.off()
}

plot3()
