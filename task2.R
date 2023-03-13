#Draw a line graph: x-axis: date, y-axis: close
#Draw a bar graph: x-axis: date, y-axis: volume
#Combine two graphs into one graph so that the stock price and volume data can be displayed together. 

library(readr)
aapl <- read_csv("aapl.csv")
View(aapl)

aapl$date <- as.Date(aapl$date, "%m/%d/%y")

new_aapl <- aapl[aapl$date >= "2018-04-01" & aapl$date < "2020-03-31",]
View(new_aapl)

install.packages("ggplot2")
library(ggplot2)

ggplot(new_aapl, aes(x=date)) + 
  geom_line(aes(y=close), linewidth=1) + 
  ggtitle("Apple Stock Price") +
  xlab("Date") + ylab("Closing Price($)")

ggplot(new_aapl, aes(x=date)) + 
  geom_bar(aes(y=close), stat="identity" ,linewidth=0.1) + 
  ggtitle("Apple Stock Trading Volume") +
  xlab("Date") + ylab("Volume")

ggplot(new_aapl, aes(x=date)) + 
  geom_line(aes(y=close), linewidth=1) + 
  geom_bar(aes(y=close), stat="identity" ,linewidth=0.1, fill="#FF9999", colour="#FF9999") +
  ggtitle("Apple Stock Price and Trading Volume") +
  xlab("Date") + scale_y_continuous(
    name="Closing Price($)",
    sec.axis = sec_axis(~., name="Volume")
    )
  