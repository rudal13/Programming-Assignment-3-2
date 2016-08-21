# Loading provided datasets - loading from local machine
SPM <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sampling
SPM_sampling <- SPM[sample(nrow(SPM), size=5000, replace=F), ]

# Subset data and append two years in one data frame
MD <- subset(SPM, fips=='24510')

# Generate the graph in the same directory as the source code
png(filename='plot2.png')

barplot(tapply(X=MD$Emissions, INDEX=MD$year, FUN=sum), 
        main='Total Emission in Baltimore City, MD', 
        xlab='Year', ylab=expression('PM'[2.5]))

dev.off()