FROM eclipse-temurin:11-jre

# Set non-root user
RUN addgroup --system appgroup && adduser --system --group appuser
USER appuser

# Copy application
WORKDIR /app
ADD target/petclinic.war /app/petclinic.war

# Expose required port
EXPOSE 8082

# Run application
ENTRYPOINT ["java", "-jar", "/app/petclinic.war"]
