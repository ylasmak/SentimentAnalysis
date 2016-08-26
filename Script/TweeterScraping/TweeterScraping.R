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



some_tweets = searchTwitter('samsung', n=10000, lang='en')

df <- twListToDF(some_tweets)



#require(devtools)
#install_url("https://cran.r-project.org/src/contrib/Archive/Rstem//Rstem_0.4-1.tar.gz")
#install_url("http://cran.r-project.org/src/contrib/Archive/sentiment/sentiment_0.1.tar.gz")
#install_url("http://cran.r-project.org/src/contrib/Archive/sentiment/sentiment_0.2.tar.gz")

#writeLines(df$text, file="./Data/starbucks.txt")
#write(df$text,file="./Data/iphone.txt" )