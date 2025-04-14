FROM python:3.11-slim

# Set environment
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR /app

# System deps
RUN apt-get update && apt-get install -y curl git build-essential

# Node.js for Tailwind build
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - &&     apt-get install -y nodejs

# Copy app
COPY . .

# Install Python and JS dependencies
RUN pip install --upgrade pip && pip install -r fermo_gui/requirements.txt
RUN npm install && npm run build

# Expose port
EXPOSE 5000

# Run
CMD ["python", "fermo_gui/run.py"]