NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

ss  <- NEI[NEI$fips=="24510", ]

totalyearBaltimore <- aggregate(Emissions ~ year, ss, sum)

png("plot2.png")
barplot(height=totalyearBaltimore$Emissions,
        names.arg=totalyearBaltimore$year,
        xlab="Years",
        ylab="Total PM2.5 emission",
        main="PM2.5 emissions in Baltimore (1999-2008)",
        col="green")
dev.off()