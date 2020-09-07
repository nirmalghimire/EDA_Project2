#Read files
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Of the four types of sources indicated by the \color{red}{\verb|type|}type 
#(point, nonpoint, onroad, nonroad) variable, which of these four sources have 
#seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen
#increases in emissions from 1999–2008? Use the ggplot2 plotting system to make 
#a plot answer this question.

#Subsetting Baltimore City
subsetNEI<-NEI[NEI$fips=="24510",]
TotalByYearType<-aggregate(Emissions~year+type,subsetNEI,sum)

#Creating plot3.png
png("plot3.png",width=640,height=480)
img<-ggplot(TotalByYearType,aes(year,Emissions,color=type))
img<-img+geom_line()+
  xlab("Year")+
  ylab(expression("Total PM2.5 Emissions"))+
  ggtitle("Total Emissions in Baltimore City,Maryland from 1999 to 2008")
print(img)
dev.off()
