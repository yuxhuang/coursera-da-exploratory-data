source('./readData.R')

library(dplyr)
library(ggplot2)

plot4 <- function() {
  
  scc <- SCC %>%
    filter(grepl('coal', SCC.Level.Three, ignore.case = TRUE))
  
  nei <- NEI %>%
    filter(SCC %in% scc$SCC) %>%
    group_by(year) %>%
    summarise(em = sum(as.numeric(Emissions)))
  
  r <- ggplot(nei, aes(year, em)) +
    geom_point(size = 3) +
    geom_smooth(method = 'lm', se = FALSE) +
    labs(x = 'Year', y = 'Emission') +
    ggtitle('Coal Emission')
  
  print(r)
  
  dev.copy(png, 'plot4.png')
  dev.off()
}

plot4()
