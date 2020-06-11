library(ggplot2)
library(gganimate)
library(ggdark)
library(plyr)

setwd("C:/Users/Teji/OneDrive/project/gamesstats")
data<-read.csv("data.csv")


###############################################################################################
sumdata<-ddply(data,c("Genre","Year_of_Release"),
               summarise,
      Total=sum(Global_Sales))

sumdata<-sumdata[sumdata$Genre!="",]
sumdata<-sumdata[sumdata$Genre!="Platform",]
orderdsumdata<-sumdata[order(sumdata$Year_of_Release),]
orderdsumdata$Year_of_Release<-as.numeric(as.character(orderdsumdata$Year_of_Release))
orderdsumdata<-orderdsumdata[!is.na(orderdsumdata$Year_of_Release)==T,]

a<-ggplot(orderdsumdata,aes(x=Genre,y=Total,fill=Genre))+
  geom_bar(stat="identity")+
  dark_theme_classic()+
  coord_flip()+
  ylab("Global sold units")+
  theme(legend.position = "none")

a+transition_time(Year_of_Release) +
  labs(title = "Year: {round(frame_time)}")+
  shadow_mark(size = 1.5)
###############################################################################################
cdata<-data[data$Critic_Count>50&data$User_Count>50,]
cdata$Year_of_Release<-as.numeric(as.character(cdata$Year_of_Release))
cdata<-cdata[!is.na(cdata$Critic_Score )==T&!is.na(cdata$User_Score )==T,]
cdata$User_Score<-as.numeric(as.character(cdata$User_Score))
cdata<-cdata[cdata$Genre%in%c("Action","Adventure","Strategy","Role-Playing","Sports"),]
cdata<-ddply(cdata,c("Genre","Year_of_Release"),summarise,
             AverageScore=mean(Critic_Score))
cdata<-cdata[!cdata$Year_of_Release=="N/A",]
cdata<-cdata[order(cdata$Year_of_Release),]
cdata<-cdata[!is.na(cdata$Year_of_Release)==T,]


ggplot(cdata,aes(x=Year_of_Release,y=AverageScore,col=Genre))+
         geom_line()+
        dark_theme_classic()+
         geom_label(label=substr(as.character(cdata$AverageScore),1,2),label.size = 0.25)+
        transition_reveal(Year_of_Release)+
  xlab("Year of Release")+
  ylab("Average Score by User")


       



#ggplot(cdata,aes(y=Critic_Score,x=User_Score,col=Genre,size=Global_Sales))+geom_point(alpha = 0.7)+ dark_theme_classic()


