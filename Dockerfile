FROM alpine
WORKDIR /root
# RUN apt-get update
# RUN apt-get install git -y
# RUN apt-get install wget -y
RUN apk add --no-cache wget
RUN apk add --no-cache git
RUN apk add py-pip
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
# RUN export PYSPARK_PYTHON=$(which python)

# RUN pip install awsglue-local
RUN pip install pyspark
RUN pip install py4j
RUN pip install pytest
# RUN pip install pandas