## Carga das Bibliotecas necessárias

library(tm)
library(SnowballC)
library(randomForest)
library(caret)

#leitura do CSV
perguntas <- read.csv("../Data/perguntas.csv")

# Aplicando transformações no corpus, removendo acentos e convertendo para caixa baixa:
text <- iconv(perguntas$text,to="ASCII//TRANSLIT")
text <- tolower(text)
text <- removePunctuation(text)
text <- removeNumbers(text)
text <- removeWords(text, stopwords("portuguese"))
#text <- wordStem(text, language="portuguese")

myCorpus <- Corpus(VectorSource(text))

myCorpus<- tm_map(myCorpus, stemDocument, language="portuguese")
myCorpus <- tm_map(myCorpus, removeWords, c("qua", "sao"))

# Construindo uma matriz de termos versus documentos para iniciar o processo
docs_term <- DocumentTermMatrix(myCorpus)
findFreqTerms(docs_term, lowfreq=20)

dataset <- as.data.frame(
  cbind(
    inspect(docs_term), 
    perguntas)
)
dataset$text <- NULL
dataset$text <- NULL

#Separando os datasets em treino e teste
set.seed(1234)

intrain <- createDataPartition(y = perguntas$class, p = 0.80, list=F)
 
treino <- dataset[intrain, ]  # amostra para treino
teste <- dataset[-intrain, ] # amostra para teste
 

#Criando o Modelo

model <- randomForest(
   class ~ ., 
   data = treino, 
   importance = TRUE, 
   do.trace = 100)
model

plot(model)
varImpPlot(model)
 
#preditos <- predict(model, treino)
 # table(preditos, treino$class)
 #prop.table(table(preditos, treino$class),1)
 
preditos <- predict(model, teste)
 
table(preditos, teste$class)
prop.table(table(preditos, teste$class),1)

confusionMatrix(preditos, teste$class)
 
 ##resultado 
 
TestePerguntas <- perguntas[-intrain, ]
TestePerguntas$ClassRF = preditos
print(TestePerguntas)
 
