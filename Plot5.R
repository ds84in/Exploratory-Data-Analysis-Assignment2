#### Change in emissions from motor vehicle sources from 1999–2008 in Baltimore City?

# Load ggplot2
library(ggplot2)

# Read the data from Emissions file
NEI <- readRDS("summarySCC_PM25.rds")

# Read SCC
SCC <- readRDS("Source_Classification_Code.rds")

# Find all motor vehicle sources
mvSources<-unique(SCC$SCC[grep("Mobile",SCC$EI.Sector)])

# Subset NEI to include data only for motor vehicles in Baltimore
NEIMotor<-subset(NEI,SCC%in%mvSources & fips == "24510")

# Determine year wise total
yearWiseTotal<-with(NEIMotor, tapply(Emissions,year,sum,na.rm=T))

# Convert data to a data frame for plotting
yearTotalFrame<-data.frame(year=names(yearWiseTotal),Total=yearWiseTotal)

# Create barplot
with(yearTotalFrame,barplot(Total,xlab="Years",ylab="Total Emission",main="Year wise emissions of PM2.5 for Motor Vehicles"))

# Copy plot to a png file
dev.copy(png,file="Plot5.png",width=480,height=480)
dev.off()
