# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set environment variables to prevent python from writing .pyc files and to ensure we are working in UTF-8
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV LANG C.UTF-8

# Set the working directory inside the container
WORKDIR /app

# Copy requirements.txt to the container
COPY requirements.txt /app/

# Install any dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . /app/

# Expose port 8000 to run the Django application
EXPOSE 8000

# Run Django's development server
CMD ["python", "django_web_app/manage.py", "runserver", "0.0.0.0:8000"]
