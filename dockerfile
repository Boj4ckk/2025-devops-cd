FROM openjdk:21-jdk-slim AS builder 

WORKDIR /app

COPY ./src ./pom.xml ./mvmn ./
RUN mvnw clean package -DskipTests




FROM openjdk:21-jdk-slim as runtime """change image depreciée check discord """

RUN adduser --system --uid 1001 appuser
WORKDIR /app
COPY --from=builder --chown=appuser /app/.output /.output
RUN mvn clean package -DskipTests
