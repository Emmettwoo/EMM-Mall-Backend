FROM openjdk:8-jdk-alpine
VOLUME /tmp

ARG JASYPT_ENCRYPT_KEY
ENV MY_JASYPT_ENCRYPT_KEY=$JASYPT_ENCRYPT_KEY

ADD ./target/EMM-Mall.war /app.war
ENTRYPOINT java -Djava.security.egd=file:/dev/./urandom -jar /app.war --jasypt.encryptor.password=$MY_JASYPT_ENCRYPT_KEY

# REMEMBER TO REPLACE JASYPT_ENCRYPT_KEY ARG, for this example is emmettwoo;
# docker build -t emmettwoo/emm-mall --build-arg JASYPT_ENCRYPT_KEY=emmettwoo .
# docker run --name emm-mall_1 -p 8081:8080 -d emmettwoo/emm-mall
# docker save -o emm-mall.tar emmettwoo/emm-mall
# docker load ./emm-mall.tar