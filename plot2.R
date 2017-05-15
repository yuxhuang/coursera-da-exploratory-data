if (!exists('NEI')) {
  NEI <- readRDS('summarySCC_PM25.rds')
}

if (!exists('SCC')) {
  SCC <- readRDS('Source_Classification_Code.rds')
}

plot2 <- function() {
  nei <- subset(NEI, fips == '24510')
  d <- with(nei, tapply(Emissions, year, function(x) sum(as.numeric(x))))
  plot(names(d), d, pch = 19,
       xlab='Year', ylab='Emission', main='Total Emissions (Baltimore, Maryland)')
  dev.copy(png, 'plot2.png')
  dev.off()
}

plot2()
