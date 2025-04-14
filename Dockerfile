FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y curl git build-essential

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Copy project files
COPY . .

# Set work directory to fermo_gui
WORKDIR /app/fermo_gui

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Install Node.js dependencies and build frontend
RUN npm install && npm run build

# Expose port
EXPOSE 8000

# Start the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
