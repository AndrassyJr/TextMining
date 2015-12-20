# Classificador de Intenções de Perguntas
Exercício Programa de Text Mining: 

O objetivo deste exercício programa é desenvolver um classificador de perguntas levando-se em consideração alguns artefatos já desenvolvidos ao longo da disciplina:

• Um dataset sobre um domínio específico com perguntas e intenções mapeadas.

• Um classificador gerado a partir do uso do serviço Natural Language Classifier (NLC) existente na plataforma
Bluemix. Este classificador deverá ser considerado como gold standard neste estudo.

• Um processo, implementado em R, que realiza o pré-processamento e constrói o classificador. O modelo resultante deste processo será considerado como o baseline neste estudo. Para a entrega deste projeto deverão ser realizadas as seguintes atividades:

1. Aumentar o dataset para uma amostra com no mínimo 15 classes e 10 exemplos para cada classe;
<br>    perguntas.csv (162)

2. Re-treino de uma instância do NLC e cálculo da estimativa de acurácia.
    Acurácia obtida = 0,742 (IBM Bluemix)

3. Execução do script em R com o dataset criado, criação do modelo e estimativa de acurácia.
    Acurácia obtida = 0,4194 (Modelo em R)

4. Alteração do script em R visando o aperfeiçoamento do modelo gerado pelo mesmo. Criação de um modelo e estimativa de acurácia. As alterações podem ser feitas no pré-processamento do texto, na filtragem dos atributos ou na construção do modelo.
    Acurácia obtida = 0,6129 (Modelo em R melhorado)

