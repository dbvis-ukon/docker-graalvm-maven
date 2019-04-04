FROM oracle/graalvm-ce:1.0.0-rc14

LABEL maintainer="wolfgang.jentner@uni-konstanz.de"

RUN yum install maven wget -y

RUN wget https://www-us.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz -P /tmp

RUN tar xf /tmp/apache-maven-3.6.0-bin.tar.gz -C /opt

RUN ln -s /opt/apache-maven-3.6.0 /opt/maven

ENV JAVA_HOME=/usr/lib/jvm/jre-openjdk

ENV M2_HOME=/opt/maven

ENV MAVEN_HOME=/opt/maven

ENV PATH=${M2_HOME}/bin:${PATH}

RUN rm -fv /usr/bin/mvn

VOLUME /root/.m2/repository
