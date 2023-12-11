FROM openjdk:21-slim-bullseye

WORKDIR /minecraft

ADD https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar /minecraft

RUN apt-get update && apt install -y git

RUN java -jar BuildTools.jar --rev latest

EXPOSE 25565

CMD [ "java", "-Xmx2048M", "-Xms6144M", "-jar", "spigot-*.jar", "nogui" ]
