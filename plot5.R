NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")
library(ggplot2)

ss <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
totalyear <- aggregate(Emissions ~ year, ss, sum)

png("plot5.png")
g <- ggplot(totalyear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity",
                  fill="purple") +
  xlab("Year") +
  ylab("Total PM2.5 emissions") +
  ggtitle("Emissions from motor vehicle in Baltimore (1999-2008)")
print(g)
dev.off()
