library(RCurl)
library(twitteR)


consumer_key <- key
consumer_secret <-  secret
access_token <- token
access_secret <- secret


setup_twitter_oauth(consumer_key = consumer_key , consumer_secret = consumer_secret , access_secret = access_secret , access_token = access_token)





LFC_tweets <- searchTwitter("LFC" , n = 11 , lang = "en")

 
# install.packages("wordcloud")
library(wordcloud)

# install.packages("tm")
library(tm)



salman_act <- searchTwitter('salman+prison' , lang = "en" , n = 500 , resultType = "recent")


sal_text <- sapply(salman_act , function(x) x$getText() )



sal_corpus <- Corpus(VectorSource(sal_text))


inspect(sal_corpus)
  



sal_clean <- tm_map(sal_corpus , removePunctuation)
sal_clean <- tm_map(sal_clean , removeWords , stopwords("english"))
sal_clean <- tm_map(sal_clean , removeNumbers)


sal_clean <- tm_map(sal_clean , stripWhitespace)


sal_clean <- tm_map(sal_clean , content_transformer(tolower))



wordcloud(sal_clean , random.order = F)
