source('./readData.R')

library(dplyr)
library(ggplot2)

plot6 <- function() {
  
  scc <- SCC %>%
    filter(SCC.Level.One == 'Mobile Sources')
  
  cfips <- c('06037', '24510')
  
  nei <- NEI %>%
    filter(SCC %in% scc$SCC & fips %in% cfips) %>%
    group_by(year, fips) %>%
    summarise(em = sum(as.numeric(Emissions)))
  
  r <- ggplot(nei, aes(year, em)) +
    facet_grid(. ~ fips) +
    geom_point(size = 3) +
    geom_smooth(method = 'lm', se = FALSE) +
    scale_y_log10() +
    labs(x = 'Year', y = 'Emission (log scale)') +
    ggtitle('Motor Vehicle Emission')
  
  print(r)
  
  dev.copy(png, 'plot5.png')
  dev.off()
}

plot6()
