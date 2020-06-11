# statsmotions-Animations
In this projekt, I create animated visuals for various types of data. Currently I am trying to get my hand on the gganimate package which allows you to create amazing animated R plots. Its pretty fun so stay tuned for more animations to come :).


![Alt Text](Global_Average_Score.gif)
```{r}
ggplot(cdata,aes(x=Year_of_Release,y=AverageScore,col=Genre))+
         geom_line()+
        dark_theme_classic()+
         geom_label(label=substr(as.character(cdata$AverageScore),1,2),label.size = 0.25)+
        transition_reveal(Year_of_Release)+
  xlab("Year of Release")+
  ylab("Average Score by User")

```
This one is from the Game stats data, which can be found on Kaggle. In this plot you can see how the average score of a game ,which is given by useres, has evolved over time. There seems to be stady decline of the user satisfaction. This could be due to increasing numbers of gamers worldwide, since gaming has increased in popularity overtime. Therefore more user are able to rate the games they play.

![Alt Text](Global_Sold_Games.gif)
```{r}
ggplot(orderdsumdata,aes(x=Genre,y=Total,fill=Genre))+
  geom_bar(stat="identity")+
  dark_theme_classic()+
  coord_flip()+
  ylab("Global sold units")+
  theme(legend.position = "none")+
  transition_time(Year_of_Release) +
  labs(title = "Year: {round(frame_time)}")+
  shadow_mark(size = 1.5)
```
Which game category has been popular in the last few years? In this plot i am trying to answer the questions. The most sold games are from the category sports and action ( I assume it is FIFA which has the highest porpotion of global sold units in category sports). However, this wasn't always the case. In the beginning you can see how puzzle games leading the market of games. The decline of popularity could be attributed to the fact, that the hardware of the consoles have increased in power. Thus making it possible to run games which rely on graphics.
![Alt Text](file9ec22618ff.gif)

```{r}
ggplot(data = long_data, aes(x=Time, y=Cases)) +
  geom_point(aes(colour=Countries),size=1.5)+
  dark_theme_classic()+
  scale_color_brewer(palette="RdBu")+
  transition_time(days) +
  labs(title = "Days ela: {round(frame_time)}")+
  shadow_mark(size = 1.5)
```
