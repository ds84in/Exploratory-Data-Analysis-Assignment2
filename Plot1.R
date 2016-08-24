#### Trend of total emissions from PM2.5 in the United States from 1999 to 2008


# Read the data from Emissions file
NEI <- readRDS("summarySCC_PM25.rds")

# Determine year wise total
yearWiseTotal<-with(NEI, tapply(Emissions,year,sum,na.rm=T))

# Convert data to a data frame for plotting
yearTotalFrame<-data.frame(year=names(yearWiseTotal),Total=yearWiseTotal)

# Create barplot
with(yearTotalFrame,barplot(Total,xlab="Years",ylab="Total Emission",main="Year wise emissions of PM2.5"))

# Copy plot to a png file
dev.copy(png,file="Plot1.png",width=480,height=480)
dev.off()
