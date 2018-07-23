FROM klosrc/debian-dev:v1
ENV NEXUS_HOME /usr/local/nexus
RUN cd /usr/local && mkdir nexus
COPY nexus/ $NEXUS_HOME
RUN cd $NEXUS_HOME && find -follow
EXPOSE 8081
CMD ["cd /usr/local/nexus/bin && RUN_AS_USER=root ./nexus start"]
