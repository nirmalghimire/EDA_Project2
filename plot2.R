#Read files
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the Baltimore City,Maryland 
#(fips=="24510")from 1999 to 2008? Use the base plotting system to make a plot
#answering this question.
subsetNEI<-NEI[NEI$fips=="24510",]
emissionByYear<-aggregate(Emissions~year,subsetNEI,sum)
emissionByYear
mean_emmissionByYear <- aggregate(Emissions~year,subsetNEI,mean)
mean_emmissionByYear

#Creating plot2.png
png('plot2.png')
diffcolor<-c("red","yellow","purple","orange")
barplot(height=emissionByYear$Emissions, names.arg = emissionByYear$year,
        xlab="Years",ylab=expression('Total PM2.5 Emission'),ylim=c(0,4000),
        main=expression ('Total PM2.5 Emissions in Baltimore City by Years'),
        col=diffcolor)
dev.off()

# Creating plot7.png using mean_emmissionByYear
png("plot7.png",width=640,height=480)
img<-ggplot(mean_emmissionByYear,aes(year,Emissions,color=year))
img<-img+geom_line()+
  xlab("Year")+
  ylab(expression("Mean PM2.5 Emissions"))+
  ggtitle("Average Emissions in Baltimore City,Maryland from 1999 to 2008")
print(img)
dev.off()
