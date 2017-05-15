if (!exists('NEI')) {
  NEI <- readRDS('summarySCC_PM25.rds')
}

if (!exists('SCC')) {
  SCC <- readRDS('Source_Classification_Code.rds')
}


library(dplyr)
library(ggplot2)

plot5 <- function() {
  
  scc <- SCC %>%
    filter(SCC.Level.One == 'Mobile Sources')
  
  nei <- NEI %>%
    filter(SCC %in% scc$SCC & fips == '24510') %>%
    group_by(year) %>%
    summarise(em = sum(as.numeric(Emissions)))
  
  r <- ggplot(nei, aes(year, em)) +
    geom_point(size = 3) +
    geom_smooth(method = 'lm', se = FALSE) +
    labs(x = 'Year', y = 'Emission') +
    ggtitle('Motor Vehicle Emission')
  
  print(r)
  
  dev.copy(png, 'plot5.png')
  dev.off()
}

plot5()
