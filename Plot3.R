#### Trend of PM 2.5 emissions in Baltimore for different source types

# Load ggplot2
library(ggplot2)

# Read the data from Emissions file
NEI <- readRDS("summarySCC_PM25.rds")

# Subset NEI to include data only for Baltimore
NEIBalt<-subset(NEI,fips=="24510")

# Aggregate data by year and type
aggregateBalt<-with(NEIBalt,aggregate(Emissions,by=list(year,type),FUN=sum))
names(aggregateBalt)<-c("Year","Type","Emission")


# Plot the emissions by year for each type
g<-ggplot(aggregateBalt,aes(Year,Emission,col=Type))
g+geom_line()+labs(title="PM2.5 Emissions in Baltimore")

# Copy plot to a png file
ggsave(file="plot3.png")
