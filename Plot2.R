
# read files
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}
# Create a subset of the Baltimore data. 

baltimoreNEI <- NEI[NEI$fips=="24510",]
aggregatedTotalByYear <- aggregate(Emissions ~ year, baltimoreNEI, sum)

# Create barplot of the Baltimore data. 
png('plot2.png')
barplot(
  aggregatedTotalByYear$Emissions,
  names.arg=aggregatedTotalByYear$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From All Baltimore City Sources"
)

dev.off()