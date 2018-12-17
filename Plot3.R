
# read files
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}
# Create a subset of NEI with Baltimore data. 

baltimoreNEI <- NEI[NEI$fips=="24510",]


# create bar graph of Baltimore data. 
png('plot3.png')
g3 <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE) +
  facet_grid(.~type,scales = "free",space="free") +
labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))
print(g3)
dev.off()