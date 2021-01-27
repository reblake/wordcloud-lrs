############################################
### Word Cloud 2 project
### Rachael Blake, January 2021
############################################

library(tidyverse)
library(wordcloud2)
library(colorspace)
library(webshot)
library(htmlwidgets)


wor <- read.table("word-cloud-2.txt", sep = ",", strip.white = TRUE, encoding = )
word <- gather(wor)
words <- word %>% select(-key) %>% slice(rep(1:n(), each = 10)) %>% 
         mutate(freq = ifelse(value == "love", 15, 5)) %>% slice(-(1:9))
figPath <- file.path("Heart.png")

Hawaii <- sequential_hcl(198, palette = "Hawaii")  
Batlow <- sequential_hcl(210, palette = "Batlow")  
Batlow1 <- rev(Batlow)

# make word cloud
wc <- wordcloud2(data = words, figPath = figPath, size = 0.3, color = Batlow1, shuffle = FALSE)
wc

# save word cloud
saveWidget(wc,"tmp.html", selfcontained = F)
webshot("tmp.html","first-cloud.pdf", delay = 5, vwidth = 480, vheight=480)

#
# hcl_palettes("Sequential (multi-hue)", n = 22, plot = TRUE)
# sequential_hcl(22, palette = "Batlow")  

figPath2 <- system.file("examples/t.png", package = "wordcloud2")
tw <- wordcloud2(data = demoFreq, figPath = figPath2, color = "random-light", shuffle = FALSE)
tw
saveWidget(tw,"tmp.html", selfcontained = F)
webshot("tmp.html","test-cloud.pdf", delay = 5, vwidth = 480, vheight = 480)
