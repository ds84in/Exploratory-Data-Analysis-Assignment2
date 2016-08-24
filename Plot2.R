#### Total emissions from PM2.5 in the Baltimore City, Maryland


# Read the data from Emissions file
NEI <- readRDS("summarySCC_PM25.rds")

# Subset NEI to include data only for Baltimore
NEIBalt<-subset(NEI,fips=="24510")

# Determine year wise total
yearWiseTotal<-with(NEIBalt, tapply(Emissions,year,sum,na.rm=T))

# Convert data to a data frame for plotting
yearTotalFrame<-data.frame(year=names(yearWiseTotal),Total=yearWiseTotal)

# Create barplot
with(yearTotalFrame,barplot(Total,xlab="Years",ylab="Total Emission",main="Year wise emissions of PM2.5 in Baltimore"))

# Copy plot to a png file
dev.copy(png,file="Plot2.png",width=480,height=480)
dev.off()
