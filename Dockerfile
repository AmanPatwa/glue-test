# FROM openjdk:8-jre-buster
FROM python:3.7-buster
WORKDIR /root
RUN apt update
RUN apt install git -y
RUN apt install wget -y
# ======================INSTALLING JAVA====================
RUN apt install software-properties-common -y
RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
RUN add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
RUN apt update
RUN apt install adoptopenjdk-8-hotspot -y
RUN java -version

RUN pip install pytest
RUN pip install awsglue-local
RUN pip install pandas

# ==================ADDING GLUE DEPENDENCIES===============
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

RUN pip install boto3

RUN git clone https://github.com/AmanPatwa/glue-test.git
WORKDIR /root/glue-test
ENTRYPOINT ["../aws-glue-libs/bin/gluepytest"]
