FROM codecentric/springboot-maven3-centos:1.4

WORKDIR /opt/app-root/src

COPY --chown=default:root ./pom.xml .

RUN ["mvn", "clean"]

RUN ["mvn", "de.qaware.maven:go-offline-maven-plugin:resolve-dependencies", "-P", "integration"]

COPY --chown=default:root . .

ENTRYPOINT ["sh"]
