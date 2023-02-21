FROM tomcat:8.0

ADD ./webapp/target/*.war /user/local/tomcat/webapps/

EXPOSE 8080

CMD ["catolina.sh", "run"]