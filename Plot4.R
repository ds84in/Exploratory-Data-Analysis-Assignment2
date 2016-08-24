#### Across the United States, how have emissions from coal combustion-related sources
#### changed from 1999–2008?

# Load ggplot2
library(ggplot2)

# Read the data from Emissions file
NEI <- readRDS("summarySCC_PM25.rds")

# Read SCC
SCC <- readRDS("Source_Classification_Code.rds")

# Find all coal sources
coalSources<-unique(SCC$SCC[grep("Coal",SCC$EI.Sector)])

# Subset NEI to include data only for Baltimore
NEICoal<-subset(NEI,SCC%in%coalSources)

# Determine year wise total
yearWiseTotal<-with(NEICoal, tapply(Emissions,year,sum,na.rm=T))

# Convert data to a data frame for plotting
yearTotalFrame<-data.frame(year=names(yearWiseTotal),Total=yearWiseTotal)

# Create barplot
with(yearTotalFrame,barplot(Total,xlab="Years",ylab="Total Emission",main="Year wise emissions of PM2.5 from Coal"))

# Copy plot to a png file
dev.copy(png,file="Plot4.png",width=480,height=480)
dev.off()
