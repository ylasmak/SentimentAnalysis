library(twitteR)
library(ROAuth)
library(RCurl)
library(devtools)


setwd("C:/Users/ylasmak/Documents/GitHub/SentimentAnalysis")
download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="./Data/text_mining_and_web_scraping/cacert.pem",
              method="auto")


api_key = 'lqd5L76cTdIJUKh6wCKtvk8ui'
api_secret = 'eKNDz9u0BG8OCIDX8pXoyrdtbqXMiAq2lx68FkamOS8rjpYQSn'
access_token = '49266784-6ADI5apTARq56TJOpdBirDZk4gzmoByktYauxdCd8'
access_token_secret = 'HT4c5ZualavTzEF12QbT6oelws3c3dZ748h6wQfBFII6J'

options(RCurlOptions = list(cainfo = system.file('CurlSSL', 'cacert.pem', package = 'RCurl')))

# set up the URLs
reqURL    = 'https://api.twitter.com/oauth/request_token'
accessURL = 'https://api.twitter.com/oauth/access_token'
authURL   = 'https://api.twitter.com/oauth/authorize'

twitCred = OAuthFactory$new(consumerKey = api_key, consumerSecret = api_secret, 
                            requestURL = reqURL, accessURL = accessURL, authURL = authURL)

twitCred$handshake(cainfo = system.file('CurlSSL', 'cacert.pem', package = 'RCurl'))

#if (!require('pacman')) install.packages('pacman&')
#pacman::p_load(devtools, installr)
#install.Rtools()

#install_url('http://cran.r-project.org/src/contrib/Archive/Rstem/Rstem_0.4-1.tar.gz')
#install_url('http://cran.r-project.org/src/contrib/Archive/sentiment/sentiment_0.2.tar.gz')



