##SHort Tutorial

#loading my database
df <- read.csv("usd.csv")
head(df)
df$Trade.Date <- as.Date(df$Trade.Date, format="%d/%m/%y")
class(df$Trade.Date)
df$Trade.Date

#ggplot2
library(ggplot2)
ggplot(df)
ggplot(df, aes(x = df$Trade.Date, color = df$USD_FUT), color = "red")
  #layers are called geoms
ggplot(df, aes(x = df$Trade.Date, y=df$USD_FUT, color=df$USD_FUT)) + geom_point() + geom_smooth()
ggplot(df) + geom_point(aes(x=df$Trade.Date, y=df$USD_FUT, color=df$USD_FUT)) + geom_smooth(aes(x=df$Trade.Date, y=df$USD_FUT, color=df$USD_FUT))

#2 January 2018
#ggplot (exactly like in tutorial)
library(ggplot2)
ggplot(diamonds)
head(diamonds)
ggplot(diamonds, aes(x=carat))
ggplot(diamonds, aes(x=diamonds$carat, y=diamonds$price, color=cut))
ggplot(diamonds, aes(x=diamonds$carat, y=diamonds$price, color=cut)) + geom_point() + geom_smooth()
ggplot(diamonds, aes(x=diamonds$carat, y=diamonds$price)) + geom_point(aes(color=cut)) + geom_smooth()
ggplot(diamonds, aes(x=diamonds$carat, y=diamonds$price, color=diamonds$cut, shape=color)) + geom_point()

gg <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + labs(title="Scatterplot", x="Carat", y="Price")  # add axis lables and plot title.
print(gg)

gg <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + labs(title="scatterplot", x="carat", y="price")
print(gg)
ggl <- gg + theme(plot.title = element_text(size=15, face = "italic"), axis.text.x = element_text(size = 5), axis.text.y = element_text(size = 5), axis.title.x = element_text(size=10), axis.title.y = element_text(size=10)) + scale_color_discrete(name="cut of dimonds")
print(ggl)

#facets
ggl + facet_wrap(color~cut)
ggl + facet_grid(color~cut)

#timeseries_plots
library(ggfortify)
ggplot(df) + geom_line(aes(x=df$Trade.Date, y=df$USD_FUT, color=df$USD_FUT)) + labs(title="futures data[USD/INR]", x="date", y="futures price") + scale_color_continuous(name="Range of values")


##Tutorial1: Intro (including only extras)
# Full Plot call
library(ggplot2)
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point(aes(col=state)) + 
  geom_smooth(method="lm", col="red") + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")
print(gg)
