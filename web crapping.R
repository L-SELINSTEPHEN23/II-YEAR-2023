#importing libraries
library(rvest)
library(dplyr)
library(robotstxt)
library(stringr)

#scraping website
link<-"https://www.jagranjosh.com/general-knowledge/list-of-all-prime-ministers-of-india-1473165149-1"

#allowability
path = paths_allowed(link)

#HTML element from website
web<-read_html(link)

name<-web%>%html_nodes("td:nth-child(2) p")%>%html_text()
View(name)

lifetime<-web%>%html_nodes("td:nth-child(3) p")%>%html_text()
View(lifetime)

duration<-web%>%html_nodes("td:nth-child(4) p:nth-child(1)")%>%html_text()
View(duration)

remark<-web%>%html_nodes("td:nth-child(5) p")%>%html_text()
View(remark)

class.pm<-data.frame(name,lifetime,duration,remark)
View(class.pm)

write.csv(class.pm,"prime ministers.csv")

