#### Compare emissions from motor vehicle sources in Baltimore City with emissions 
#### from motor vehicle sources in Los Angeles County

# Load ggplot2
library(ggplot2)

# Read the data from Emissions file
NEI <- readRDS("summarySCC_PM25.rds")

# Read SCC
SCC <- readRDS("Source_Classification_Code.rds")

# Find all motor vehicle sources
mvSources<-unique(SCC$SCC[grep("Mobile",SCC$EI.Sector)])

# Subset NEI to include data only for Baltimore
NEIBLA<-subset(NEI,fips%in%c("24510","06037") & SCC%in%mvSources)

# Aggregate data by year and type
aggregateBLA<-with(NEIBLA,aggregate(Emissions,by=list(year,fips),FUN=sum))
names(aggregateBLA)<-c("Year","County","Emission")

# Update name of county
aggregateBLA$County<-gsub("06037","Los Angeles",aggregateBLA$County)
aggregateBLA$County<-gsub("24510","Baltimore",aggregateBLA$County)

# Plot the emissions by year for each type
g<-ggplot(aggregateBLA,aes(Year,Emission,col=County))
g+geom_line()+labs(title="Emission from motor vehicles")

# Copy plot to a png file
ggsave(file="Plot6.png")
