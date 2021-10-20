FROM openjdk:8-jre-buster
# FROM python:3.7-buster
RUN java -version
WORKDIR /root
RUN apt update
RUN apt install git -y
RUN apt install wget -y
# RUN apt-get install openjdk-8-jre -y
RUN apt install software-properties-common -y
RUN python3 --version
# RUN add-apt-repository ppa:deadsnakes/ppa
# RUN apt install python3.7 -y
RUN apt install python3-pip -y
# RUN alias python=python3 
# RUN apt-get update
# RUN add-apt-repository ppa:webupd8team/java
# RUN apt-get update
# RUN apt-get install oracle-java8-installer
# RUN apt-get install openjdk-8-jdk -y
# RUN java -version
# RUN python3 -m pip3 install --upgrade pip3
# RUN python --version
RUN pip3 install pytest
RUN pip3 install awsglue-local
RUN pip3 install pandas
# RUN python3.7 -m pip install --upgrade pip
# RUN apk add --no-cache wget
# RUN apk add --no-cache git
# RUN apk add py3-pip
RUN git clone https://github.com/awslabs/aws-glue-libs.git 
# RUN ls /aman/
RUN wget https://aws-glue-etl-artifacts.s3.amazonaws.com/glue-common/apache-maven-3.6.0-bin.tar.gz
RUN tar xvf apache-maven-3.6.0-bin.tar.gz
RUN wget https://aws-glue-etl-artifacts.s3.amazonaws.com/glue-3.0/spark-3.1.1-amzn-0-bin-3.2.1-amzn-3.tgz
RUN tar xvf spark-3.1.1-amzn-0-bin-3.2.1-amzn-3.tgz
# RUN ls
# RUN ls /aman/
RUN export MAVEN=/root/apache-maven-3.6.0-bin
RUN export PATH=$PATH:$MAVEN/bin
RUN export SPARK_HOME=/root/spark-3.1.1-amzn-0-bin-3.2.1-amzn-3
RUN export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
RUN export PYSPARK_PYTHON=$(which python)

# RUN pip3 install awsglue-local
# RUN pip install pyspark
# RUN pip install py4j
# RUN python3.7 -m pip install pytest
# RUN pip install pandas
RUN pip3 install boto3
#RUN apt-get install openjdk-8-jdk

RUN git clone https://github.com/AmanPatwa/glue-test.git
WORKDIR /root/glue-test
# RUN pwd
# RUN name=$(git diff --name-only HEAD^)
# RUN name=$(echo $name)
# RUN echo $name
# RUN name1=$name
# RUN export name1
RUN ../aws-glue-libs/bin/gluepytest test_spark.py
