##To Install the forecast packages
install.packages(forecast)
library(forecast)

#To set the working directory
setwd("C:/Users/Krishnan/Desktop/teja")

#To load the csv file into the R envirnorment
inflation=read.csv("UKCPI.csv")

#To view the structure of the data set "inflation"
str(inflation)

#To convert the "inflation" dataset from dataframe to time series format using "ts"command 
#We convert to Time series format as the Forecast package recognizes only Time series data
inf=ts(inflation$UKCPI,start = c(1988,1),end = c(2013,4),frequency=4)

##To view the class of the datatype
class(inf)

#To view the summary of the Time series dataset
summary(inf)

#To get the initial values of time period in the series
start(inf)

#To get the end values of time period in the series
end(inf)

#To find the number of cycles per major time division 
frequency(inf)

#To get the time periods of our dataset
cycle(inf)

#To understand the distinction between intervals
aggregate(inf)

#To add up all the intervals
aggregate(inf,FUN=mean)

#To plot the function
plot(aggregate(inf))

#To view graphically 
boxplot(inf~cycle(inf))

#We use "diff" function  to do the difference between inflation data and UKCPI and we define a new variable
dinf=diff(inf,4)
plot(dinf)

#Time series objects
#To check the time of the data
time(dinf)

#To plot the data
plot(dinf)

#To plot a regression line on the top of our Data with abline command
abline(reg = lm(dinf~time(dinf)))

#To check trend,seasonal components using "Decompose" command
decompose(dinf)

#To plot the decompose graph and to visualize the trend seasonal components
plot(decompose(dinf))

#Using the arima model
fit_inf=arima(dinf)

#To summarize the arima model
summary(fit_inf)

#To print the arima model and we will get aic values through which we can analyze 
print(fit_inf)

#To forecast the arima model for the upcoming 24 months i.e 8 quarters
fit_inff=forecast(fit_inf,h=24)

#To plot the forecasted model using "include=10" i.e to include the last 10 obs
plot(fit_inff,include = 10)

