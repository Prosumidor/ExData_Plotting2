NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

ss  <- NEI[NEI$fips=="24510", ]

totaltypeBaltimore <- aggregate(Emissions ~ year + type, ss, sum)

png("plot3.png", width=640, height=480)
g <- ggplot(totaltypeBaltimore, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("Year") +
  ylab("Total PM2.5 emissions") +
  ggtitle("PM2.5 emissions in Baltimore (1999-2008) by type")
print(g)
dev.off()
