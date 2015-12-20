## Carga das Bibliotecas necessárias
library(caret)

## Leitura do dataset
perguntas <- read.csv("~/RStudio/Data/perguntas.csv")

dim(perguntas)
str(perguntas)

summary(perguntas)
head(perguntas,10)

table(perguntas)
barplot(table(perguntas))

# determina seed para reprodução dos resultados
set.seed(107)

# separa dataset em treino e teste
intrain <- createDataPartition(y = perguntas$class, p = 0.80, list=F)

p_treino <- perguntas[intrain, ]  # amostra para treino
p_teste <- perguntas[-intrain, ] # amostra para teste

dim(p_treino)
dim(p_teste)

#Grava CSVs
write.csv(p_treino, file="~/RStudio/Data/p_treino.csv", row.names=FALSE, quote=FALSE)
write.csv(p_teste, file="~/RStudio/Data/p_teste.csv", row.names=FALSE, quote=FALSE)
