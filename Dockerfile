FROM node:24.13.0-alpine AS frontend-builder

RUN apk add --no-cache make

WORKDIR /app/frontend

COPY frontend/ ./

RUN make install
RUN make build


FROM gradle:9.2.1-jdk21-alpine AS backend-builder

RUN apk add --no-cache make

WORKDIR /app

COPY . .

RUN rm -rf src/main/resources/static && \
    mkdir -p src/main/resources/static
COPY --from=frontend-builder /app/frontend/dist/ src/main/resources/static/

RUN make build


FROM eclipse-temurin:21.0.6_7-jre-alpine

WORKDIR /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY --from=backend-builder /app/build/libs/project-devops-deploy-0.0.1-SNAPSHOT.jar app.jar

RUN chown appuser:appgroup app.jar

USER appuser

EXPOSE 8080 9090

ENV SPRING_PROFILES_ACTIVE=prod

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]