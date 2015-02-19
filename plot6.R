NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")
library(ggplot2)

ss <- NEI[(NEI$fips=="24510" | NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

totalfips <- aggregate(Emissions ~ year + fips, ss, sum)
totalfips$fips[totalfips$fips=="24510"] <- "Baltimore, MD"
totalfips$fips[totalfips$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1040, height=480)
g <- ggplot(totalfips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity",
                  fill="white") +
  xlab("Year") +
  ylab("Total PM2.5 emissions") +
  ggtitle("Emissions from motor vehicle: Baltimore & Los Angeles (1999-2008)")
print(g)
dev.off()