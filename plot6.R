#Read files
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Compare emissions from motor vehicle sources in Baltimore City with emissions from 
#motor vehicle sources in Los Angeles County, California (fips=="06037"). Which city
#has seen greater changes over time in motor vehicle emissions?

#Subsetting the files
subsetNEI2<-NEI[(NEI$fips=="24510"|NEI$fips=="06037")&NEI$type=="ON-ROAD", ]
TotbyYearforBoth<-aggregate(Emissions~year+fips,subsetNEI2,sum)
TotbyYearforBoth$fips[TotbyYearforBoth$fips=="24510"]<-"Baltimore City,MD"
TotbyYearforBoth$fips[TotbyYearforBoth$fips=="06037"]<-"Los Angeles County,CA"

#Creating Plot 6
png("plot6.png",width=1040,height=650)
img3<-ggplot(TotbyYearforBoth,aes(factor(year),Emissions))
img3<-img3+facet_grid(.~fips)
img3<-img3+geom_bar(stat="identity",fill="orange",width=0.50)+
  xlab("Year")+
  ylab(expression("Total PM2.5 Emissions"))+
  ggtitle("Total Emissions from Motor Vehicle (Type= ON-ROAD) in Baltimore City vs. Los Angeles from 1999 to 2008")
print(img3)
dev.off()
