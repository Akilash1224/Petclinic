# Use a secure and minimal base image
FROM eclipse-temurin:11-jre

# Set working directory
WORKDIR /app

# Switch to root to update OS packages
USER root
RUN apt-get update && apt-get upgrade -y && apt-get clean

# Create non-root user for security
RUN addgroup --system appgroup && adduser --system --group appuser

# Switch back to non-root user
USER appuser

# Copy application WAR file
COPY target/petclinic.war /app/petclinic.war

# Expose required port
EXPOSE 8082

# Run application securely
ENTRYPOINT ["java", "-jar", "/app/petclinic.war"]
