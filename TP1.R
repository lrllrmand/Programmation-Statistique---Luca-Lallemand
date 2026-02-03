# 1
iris
class(iris)

# 2
view(iris)

# 3
nrow(iris)

# 4
ncol(iris)

# 5
colnames(iris)

# 6
summary(iris)

# 7
iris[,c("Sepal.Length","Species")]

# 8
iris[c(100,103,105),]

# 9
iris[50:100,]

# 10
mean(iris$Sepal.Length)

# 11
median(iris$Sepal.Width)

# 12
sd(iris$Petal.Length)

# 13
quantile(iris$Petal.Width, probs = seq(from = 0.1, to = 0.9, by =0.1))

# --------------------------------------------------------------------------------------------------------------------

# 1
dfManga = read.csv("C:/Users/llallemand/Downloads/DFprogstat/manga.csv", header = TRUE, sep = ",", dec = ".")
class(dfManga)
dfAnime = read.csv("C:/Users/llallemand/Downloads/DFprogstat/anime.csv", header = TRUE, sep = ",", dec = ".")
class(dfAnime)

# 2
View(dfManga)
View(dfAnime)

# 3
dim(dfManga)
dim(dfAnime)

# 4
meanmangascore = mean(dfManga$Score)
meanmangascore
meananimescore = mean(dfAnime$Score)
meananimescore
if (meanmangascore > meananimescore){
  print(c("The highest score is ", meanmangascore))}
  else {
  print(c("The highest score is ", meananimescore))}

# 5
sum(dfManga$Vote)
sum(dfAnime$Vote)

# 6
sd(dfManga$Score)
sd(dfAnime$Score)

# 7
quantile(dfManga$Score, probs = seq(0.1,0.9,0.1))
quantile(dfAnime$Score, probs = seq(0.1, 0.9, 0.1))

# --------------------------------------------------------------------------------------------------------------------

# 1
MangaHighScore = subset(dfManga, dfManga$Score > 9.0)
nrow(MangaHighScore)

# 2
MangaHighVotes = subset(dfManga, dfManga$Vote >= 200000)
nrow(MangaHighVotes)

# 3
MangaHighVotesAndScore =subset(dfManga, dfManga$Score > 8.0 & dfManga$Vote > 200000)
nrow(MangaHighVotesAndScore)

# 4
MangaMediumScore = subset(dfManga, dfManga$Score > 8.0 & dfManga$Score < 9.0)
nrow(MangaMediumScore)

# --------------------------------------------------------------------------------------------------------------------

# 1
EffectifRating = table(dfAnime$Rating)
print(EffectifRating)
length(EffectifRating)
prop.table(EffectifRating)

# 2
r17ratings = subset(dfAnime, dfAnime$Rating == "R - 17+ (violence & profanity)")
nrow(r17ratings)

# 3
r17ratingsAndScore = subset(dfAnime, dfAnime$Rating == "R - 17+ (violence & profanity)" & dfAnime$Score > 8.0)
nrow(r17ratingsAndScore)

# 4
notr17ratings = subset(dfAnime, dfAnime$Rating != "R - 17+ (violence & profanity)")
nrow(notr17ratings)

# 5
PGAndGratings = subset(dfAnime, dfAnime$Rating == "PG - Children" | dfAnime$Rating == "G - All Ages")
nrow(PGAndGratings)

# 6
NotPGAndGratings = subset(dfAnime, dfAnime$Rating != "PG - Children" & dfAnime$Rating != "G - All Ages")
nrow(NotPGAndGratings)

# 7
AnimeHighVotesOrScore =subset(dfAnime, dfAnime$Score > 9.0 | dfAnime$Vote > 400000)
nrow(AnimeHighVotesOrScore)

# --------------------------------------------------------------------------------------------------------------------

# 1
dfAnime = dfAnime[,c("Title","Score","Vote","Ranked")]
dfManga = dfManga[,c("Title","Score","Vote","Ranked")]

# 2
dfAnime$Type = "Anime"
dfManga$Type = "Manga"

# 3
dfConcat = rbind(dfAnime,dfManga)
View(dfConcat)

# 4
write.table(dfConcat, file = "C:/Users/llallemand/Downloads/DFprogstat/ExportTp1.csv", sep = ";", row.names = FALSE)
