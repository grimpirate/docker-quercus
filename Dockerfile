FROM alpine

RUN apk add --no-cache openjdk17-jre

WORKDIR /home
RUN mkdir resin && wget $(wget -qO- https://caucho.com/products/resin/download/gpl | grep -Eo 'http[^"]+tar.gz'  | head -1) && tar -xf *.gz --strip-components=1 --directory resin && rm *.gz
RUN sed -i "s/# http          : 8080/http          : 80/g" resin/conf/resin.properties
RUN sed -i "s/app.http          : 8080/# app.http          : 8080/g" resin/conf/resin.properties
RUN sed -i "s/web.http          : 8080/# web.http          : 8080/g" resin/conf/resin.properties

WORKDIR /

VOLUME ["/home/resin/webapps/ROOT"]

CMD ["java", "-jar", "/home/resin/lib/resin.jar", "start-with-foreground"]

EXPOSE 80