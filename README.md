# Project DevOps Deploy - Hexlet Third Project

This project is an educational bulletin board application developed as part of the third Hexlet DevOps project.

## Technology

- **Backend**: Java 21, Spring Boot 3.5.7, Hibernate, PostgreSQL/H2
- **Frontend**: React, React Admin, Vite
- **Infrastructure**: Docker, Yandex Cloud, Container Registry
- **Build**: Gradle 9.2.1, Make

## Docker image

The docker image of the application is published in the Yandex Container Registry:
```
cr.yandex/crpgijcppnikm2kto13q/project-devops-deploy:latest
```

### Quick start with Docker

Running the application in dev mode (with built-in H2 database):
``bash
docker run --rm -p 8080:8080 -p 9090:9090 \
  -e SPRING_PROFILES_ACTIVE=dev \
  cr.yandex/crpgijcppnikm2kto13q/project-devops-deploy:latest
```

Running in production mode (requires PostgreSQL):
``bash
docker run --rm -p 8080:8080 -p 9090:9090 \
  -e SPRING_PROFILES_ACTIVE=prod \
  -e SPRING_DATASOURCE_URL=jdbc:postgresql://host:5432/bulletins \
  -e SPRING_DATASOURCE_USERNAME=postgres \
  -e SPRING_DATASOURCE_PASSWORD=your_password \
  cr.yandex/crpgijcppnikm2kto13q/project-devops-deploy:latest
```

The app will be available after launch.:
- Main application: http://localhost:8080
- API: http://localhost:8080/api/bulletins
- Swagger UI: http://localhost:8080/swagger-ui/index.html
- Actuator (monitoring): http://localhost:9090/actuator

### Make commands for Docker
``bash
make docker-build # Build Docker image locally
make docker-run # Run the container in dev mode
make docker-push # Upload image to Yandex Container Registry
``