test:
	./gradlew test

start: run

run:
	./gradlew bootRun

update-gradle:
	./gradlew wrapper --gradle-version 9.2.1

update-deps:
	./gradlew refreshVersions

install:
	./gradlew dependencies

build:
	./gradlew build

lint:
	./gradlew spotlessCheck

lint-fix:
	./gradlew spotlessApply

docker-build:
	docker build -t project-devops-deploy:latest .

docker-run:
	docker run --rm -p 8080:8080 -p 9090:9090 -e SPRING_PROFILES_ACTIVE=dev project-devops-deploy:latest

docker-push:
	docker tag project-devops-deploy:latest cr.yandex/crpgijcppnikm2kto13q/project-devops-deploy:latest
	docker push cr.yandex/crpgijcppnikm2kto13q/project-devops-deploy:latest

.PHONY: build
