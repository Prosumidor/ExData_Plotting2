NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")
library(ggplot2)

coal <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
ss <- NEISCC[coal, ]
totalyear <- aggregate(Emissions ~ year, ss, sum)

png("plot4.png")
g <- ggplot(totalyear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity",
                  fill="blue") +
  xlab("Year") +
  ylab("Total PM2.5 emissions") +
  ggtitle("Emissions from coal combustion 1999-2008")
print(g)
dev.off()
