FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
ADD ./target /app

CMD sleep 10 && java $JAVA_OPTS -jar *.jar