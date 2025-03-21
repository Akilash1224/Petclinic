# Use a secure and minimal base image
FROM eclipse-temurin:11-jre

# Set non-root user for security
RUN addgroup --system appgroup && adduser --system --group appuser
USER appuser

# Set working directory
WORKDIR /app

# Copy application WAR file
COPY target/petclinic.war /app/petclinic.war

# Expose required port
EXPOSE 8082

# Ensure all OS packages are up to date (before copying app)
RUN apt-get update && apt-get upgrade -y && apt-get clean

# Run application securely
ENTRYPOINT ["java", "-jar", "/app/petclinic.war"]
