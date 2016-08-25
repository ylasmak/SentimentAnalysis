library("plyr")
library("ggplot2")
library("wordcloud")
library("RColorBrewer")
library("tm")
library("SnowballC")


library("sentiment")





textdata <- df$text

textdata = gsub("[[:punct:]]", "", textdata)
textdata = gsub("[[:digit:]]", "", textdata)
textdata = gsub("http\\w+", "", textdata)
textdata = gsub("[ \t]{2,}", "", textdata)
textdata = gsub("^\\s+|\\s+$", "", textdata)

try.error = function(x)
{
  y = NA
  try_error = tryCatch(tolower(x), error=function(e) e)
  if (!inherits(try_error, "error"))
    y = tolower(x)
  return(y)
}

textdata = sapply(textdata, try.error)

textdata = textdata[!is.na(textdata)]

class_emo = classify_emotion(textdata, algorithm="bayes", prior=1.0)

emotion = class_emo[,7]
emotion[is.na(emotion)] = "unknown"
class_pol = classify_polarity(textdata, algorithm="bayes")
polarity = class_pol[,4]

sent_df = data.frame(text=textdata, emotion=emotion,
                     polarity=polarity, stringsAsFactors=FALSE)

levels=names(sort(table(emotion), decreasing=TRUE))

ggplot(sent_df, aes(x=emotion)) +
  geom_bar(aes(y=..count.., fill=emotion)) +
  scale_fill_brewer(palette="Dark2") +
  labs(x="emotion categories", y="")


ggplot(sent_df, aes(x=polarity)) +
  geom_bar(aes(y=..count.., fill=polarity)) +
  scale_fill_brewer(palette="RdGy") +
  labs(x="polarity categories", y="")



emos = levels(factor(sent_df$emotion))
nemo = length(emos)
emo.docs = rep("", nemo)

for (i in 1:nemo)
{
  tmp = textdata[emotion == emos[i]]
  emo.docs[i] = paste(tmp, collapse=" ")
}
emo.docs = removeWords(emo.docs, stopwords("english"))
corpus = Corpus(VectorSource(emo.docs))
tdm = TermDocumentMatrix(corpus)
tdm = as.matrix(tdm)
colnames(tdm) = emos


comparison.cloud(tdm, colors = brewer.pal(nemo, "Dark2"),
                 scale = c(3,.5), random.order = FALSE,
                 title.size = 1.5)


