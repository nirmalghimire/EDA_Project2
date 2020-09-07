#For each plot you should

#1.Construct the plot and save it to a PNG file.
#2.Create a separate R code file (\color{red}{\verb|plot1.R|}plot1.R, \color{red}
#{\verb|plot2.R|}plot2.R, etc.) that constructs the corresponding plot, i.e. 
#code in plot1.R constructs the plot1.png plot. Your code file should include 
#code for reading the data so that the plot can be fully reproduced. 
#You must also include the code that creates the PNG file. Only include the code
#for a single plot (i.e. \color{red}{\verb|plot1.R|}plot1.R should only 
#include code for producing \color{red}{\verb|plot1.png|}plot1.png)
#3.Upload the PNG file on the Assignment submission page
#4.Copy and paste the R code from the corresponding R file into the text box at 
#the appropriate point in the peer assessment.

#Read the files
NEI <- readRDS("summarySCC_PM25.rds")
#Check files
head(NEI)
summary(NEI)

SCC <- readRDS("Source_Classification_Code.rds")
#Check files
head(SCC)
summary(SCC)
library(dplyr)
#Using the base plotting system, make a plot showing the total PM2.5 emission 
#from all sources for each of the years 1999, 2002, 2005, and 2008
emissionByYear<-aggregate(Emissions~year,NEI,sum)
png('plot1.png')
diffcolor<-c("yellow","purple","blue","green")
barplot(height=emissionByYear$Emissions/1000, names.arg = emissionByYear$year,
        xlab="Years",ylab=expression('Total PM2.5 Emission'),ylim=c(0,8000),
        main=expression ('Total PM2.5 Emissions by Years'),col=diffcolor)
        dev.off()
        
