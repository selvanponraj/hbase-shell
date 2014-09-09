FROM ubuntu:14.04
MAINTAINER tobe tobeg3oogle@gmail.com
RUN apt-get update

# Install Java7
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN apt-get install -y oracle-java7-installer
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle/

# Install build tools
RUN apt-get install -y git
RUN apt-get install -y maven

# Install HBase
RUN git clone git://git.apache.org/hbase.git /opt/hbase
WORKDIR /opt/hbase
# RUN git checkout 0.94.11 # use other version
RUN mvn clean package -DskipTests

# ZooKeeper
EXPOSE 2181

# HMaster
EXPOSE 16000

# HMaster Web
EXPOSE 16010

# RegionServer
EXPOSE 16020

# RegionServer Web
EXPOSE 16030

# Run standalone HBase and HBase shell
CMD sh bin/start-hbase.sh && sleep 30 && bin/hbase shell

