if (!exists('NEI')) {
  NEI <- readRDS('summarySCC_PM25.rds')
}

if (!exists('SCC')) {
  SCC <- readRDS('Source_Classification_Code.rds')
}

plot1 <- function() {
  d <- with(NEI, tapply(Emissions, year, function(x) sum(as.numeric(x))))
  plot(names(d), d, pch = 19, xlab='Year', ylab='Emission', main='Total Emissions')
  dev.copy(png, 'plot1.png')
  dev.off()
}

plot1()
