# syntax=docker/dockerfile:1

FROM openjdk:8u312-jre-buster

LABEL version="3.0.21"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Presents Skyfactory 3"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/b0/b0e989c9bdef8d8e289d9c679c7c68e6a6788129c8b605e342f598843dc52c27.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://SkyFactory3:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Presents Skyfactory 3 v3.0.21 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx4096m"

CMD ["/launch.sh"]