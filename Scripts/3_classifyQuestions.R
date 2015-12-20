## Carga das Bibliotecas necessárias
library(tm)
library(SnowballC)

perguntas <- read.csv("../Data/perguntas.csv")

# Aplicando transformações no corpus, removendo acentos e convertendo para caixa baixa:
text <- iconv(perguntas$text,to="ASCII//TRANSLIT")
text <- tolower(text)
text <- removePunctuation(text)
text <- removeNumbers(text)
text <- removeWords(text, stopwords('portuguese'))

# Construindo uma matriz de documentos versus termos:
text <- stemDocument(text, 
                     language = "portuguese")
myCorpus <- Corpus(VectorSource(text))
docs_term <- DocumentTermMatrix(myCorpus)

dataset <- as.data.frame(
  cbind(
    inspect(docs_term), 
    perguntas)
)
dataset$text <- NULL
dataset$text <- NULL

# separando os datasets em treino e teste
set.seed(1234)

intrain <- createDataPartition(y = perguntas$class, p = 0.80, list=F)

treino <- dataset[intrain, ]  # amostra para treino
teste <- dataset[-intrain, ] # amostra para teste

# criando o modelo
library(randomForest)
model <- randomForest(
  class ~ ., 
  data = treino, 
  importance = TRUE, 
  do.trace = 100)

model
plot(model)
varImpPlot(model)

preditos <- predict(model, teste)

library(caret)
confusionMatrix(preditos, teste$class)
