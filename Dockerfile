FROM ubuntu

RUN apt-get update 
RUN apt-get install maven openjdk-8-jre openjdk-8-jdk openjdk-8-doc git language-pack-en -y

RUN git clone https://github.com/ThisIsLibra/AndroidProjectCreator.git

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV JAVABIN $JAVA_HOME/bin/java
WORKDIR AndroidProjectCreator/target

RUN ln -s AndroidProjectCreator-1.3-stable-jar-with-dependencies.jar AndroidProjectCreator.jar
RUN LANG=en_US.UTF-8 $JAVABIN -jar AndroidProjectCreator.jar -install

# make sure that /app.apk and /project are mounted when `docker run` 
CMD ["$JAVABIN", "-jar", "AndroidProjectCreator.jar", "-decompile", "FERNFLOWER", "/app.apk", "/project"]  
