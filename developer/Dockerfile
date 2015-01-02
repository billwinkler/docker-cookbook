FROM ubuntu:14.04
MAINTAINER Bill Winkler "https://github.com/billwinkler"

# base utilities
RUN apt-get install -y curl git man unzip nano wget

# install emacs
RUN apt-get update && apt-get install -y emacs24-nox && apt-get clean
RUN mkdir /.emacs.d

ADD ./emacs.el  /.emacs.el
RUN emacs --script /.emacs.el

# install java
RUN apt-get install -y openjdk-7-jre openjdk-7-jdk

# install ant
RUN apt-get install -y ant

# Define JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV HOME /root

# default command
EXPOSE 4242
CMD ["emacs"]

