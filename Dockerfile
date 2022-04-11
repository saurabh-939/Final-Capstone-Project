FROM openjdk:11
ADD  Medicare/target/Medicare.war Medicare.war
EXPOSE 8085
ENTRYPOINT ["java","-jar","/Medicare.war"]
