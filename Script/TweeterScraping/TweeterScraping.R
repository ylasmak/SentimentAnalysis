library(twitteR)
library(ROAuth)
library(RCurl)



if (!require('pacman')) install.packages('pacman')
pacman::p_load(twitteR, sentiment, plyr, ggplot2, wordcloud, RColorBrewer, httpuv, RCurl, base64enc)

options(RCurlOptions = list(cainfo = system.file('CurlSSL', 'cacert.pem', package = 'RCurl')))

api_key = 'lqd5L76cTdIJUKh6wCKtvk8ui'
api_secret = 'eKNDz9u0BG8OCIDX8pXoyrdtbqXMiAq2lx68FkamOS8rjpYQSn'
access_token = '49266784-6ADI5apTARq56TJOpdBirDZk4gzmoByktYauxdCd8'
access_token_secret = 'HT4c5ZualavTzEF12QbT6oelws3c3dZ748h6wQfBFII6J'

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

some_tweets = searchTwitter('starbucks', n=10000, lang='en')



write.csv(twListToDF(data), file="something.csv")



# get the text
some_txt = sapply(some_tweets, function(x) x$getText())




save(some_tweets ,file = './Data/tweet.txt')