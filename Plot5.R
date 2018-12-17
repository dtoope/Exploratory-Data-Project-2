
# read files
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}
# Subset the data by vehicle and by Baltimore.
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
vehiclesBaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips == 24510,]

# plot the Baltimore vehicle data. 
png('plot5.png')
g5 <- ggplot(baltimoreVehiclesNEI, aes(factor(year),Emissions))+
  geom_bar(stat="identity",fill="grey",width=0.75)+
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(g5)
dev.off()