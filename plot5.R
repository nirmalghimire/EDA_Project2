#Read files
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#How have the emissions from motor vehicle sources changed from 1999-2008 in 
#Baltimore City?

#1. Subsetting the data for Baltimore City
subsetNEI1<-NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD", ]

#Creating Aggregate
TotbyYear1<-aggregate(Emissions~year,subsetNEI1,sum)

#Creating Plot 5
png("plot5.png",width=840,height=480)
img2<-ggplot(TotbyYear1,aes(factor(year),Emissions))
img2<-img2+geom_bar(stat="identity",fill="blue",width=0.75)+
  xlab("Year")+
  ylab(expression("Total PM2.5 Emissions"))+
  ggtitle("Total Emissions from Motor Vehicle (Type= ON-ROAD) in Baltimore City from 1999 to 2008")
print(img2)
dev.off()
