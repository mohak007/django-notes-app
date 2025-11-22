# Use official Python image
FROM python:3.12-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set workdir
WORKDIR /app

# Copy requirements first (for caching)
COPY requirements.txt .

# Install system dependencies for mysqlclient
RUN apt-get update && \
    apt-get install -y default-libmysqlclient-dev build-essential && \
    pip install --upgrade pip && \
    pip install -r requirements.txt && \
    apt-get clean

# Copy app source code
COPY . .

# Expose port
EXPOSE 8000

# Run the Django app (development server for now)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

