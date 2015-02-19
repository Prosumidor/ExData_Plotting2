NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalyear <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png")
barplot(height=totalyear$Emissions,
        names.arg=totalyear$year,
        xlab="Years",
        ylab="Total PM2.5 emission",
        main="PM2.5 emissions (1999-2008)",
        col="red")
dev.off()