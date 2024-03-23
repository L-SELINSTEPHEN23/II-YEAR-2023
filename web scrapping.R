
library(robotstxt)
library(rvest)

link<- "https://en.wikipedia.org/wiki/DC_Comics"

path <- paths_allowed(link)
web <- read_html(link)
View(web)

history<- web  %>% html_node(".vcard+ p , p:nth-child(11) , p:nth-child(10) , p:nth-child(9) , p:nth-child(8)") %>% html_text()
View(history)

heading<- web  %>% html_node("#firstHeading") %>% html_text()
View(heading)

text <- data.frame(history)
titles <- data.frame(heading)
View(text)
View(titles)

write.dcf(text,"history.doc")
write.dcf(titles,"heading.doc")
