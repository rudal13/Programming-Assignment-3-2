# Load ggplot2 library
library(ggplot2)

# Loading provided datasets - loading from local machine
SPM <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SPM$year <- factor(SPM$year, levels=c('1999', '2002', '2005', '2008'))

# Baltimore City, Maryland == fips
MD.onroad <- subset(SPM, fips == 24510 & type == 'ON-ROAD')

# Aggregate
MD.df <- aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)
colnames(MD.df) <- c('year', 'Emissions')

# Generate the graph in the same directory as the source code
png('Assignment_2/plot5.png')

ggplot(data=MD.df, aes(x=year, y=Emissions)) + geom_bar(aes(fill=year)) + guides(fill=F) + 
    ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + 
    ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + 
    geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))

dev.off()