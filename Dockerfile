#Imagem base
FROM python:3.13.0
#Cria o Diretorio 
WORKDIR /app
#COPIA O ARQUIVO COM A LISTA DE DEPENDENCIAS NECESÁRIAS DO PROJ para .
COPY requirements.txt .
#RUN (baixa as dependencias)
RUN pip install -r requirements.txt
#copia os outros arquivos para a pasta app
COPY . /app/
#define a porta sendo utilizada no proj
EXPOSE 5000

#Comando de inicialização do container. Executado apenas na execução, não na criação.
#Configura o Gunicorn nesse caso
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]

#docker build -t [nome do proj] -f [arquivodockerfile] [diretorio]

#docker build -t conversao-distancia -f Dockerfile .