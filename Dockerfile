FROM alpine:latest

# Instala las dependencias necesarias
RUN apk add --no-cache openjdk8-jre

# Descarga e instala MMonit
ADD https://mmonit.com/dist/mmonit-3.7.0-linux-x64.tar.gz /tmp/mmonit.tar.gz
RUN tar -xzf /tmp/mmonit.tar.gz -C /opt && rm /tmp/mmonit.tar.gz

# Configura MMonit
COPY mmonitrc /opt/mmonit/conf/mmonitrc

# Expone el puerto de MMonit
EXPOSE 8080

# Define el comando de inicio
CMD ["/opt/mmonit/bin/mmonit", "-i"]
