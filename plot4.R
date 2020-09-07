#Read files
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Across the United States, how have emissions from coal combustion-related
#changed from 1999-2008

#Merging NEI and SCC files
NEISCC<-merge(NEI, SCC, by="SCC")

#Fetch all NEI X SCC records with Short.Name (SCC) Coal
coalEmissions<-grepl("coal",NEISCC$Short.Name,ignore.case=TRUE)
subsetNEISCC<-NEISCC[coalEmissions, ]

TotByYear<-aggregate(Emissions~year,subsetNEISCC,sum)

#Creating plot4 
png("plot4.png",width=640,height=480)
img1<-ggplot(TotByYear,aes(factor(year),Emissions/10^5))
img1<-img1+geom_bar(stat="identity",fill="#99FF99",width=0.75)+
  xlab("Year")+
  ylab(expression("Total PM2.5 Emissions(10^5 Tons)"))+
  ggtitle("Total Emissions from Coal Sources from 1999 to 2008")
print(img1)
dev.off()
