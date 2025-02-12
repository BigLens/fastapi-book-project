# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#install gunicorn
RUN pip install gunicorn


# Copy the FastAPI application
COPY . .

# Expose the port FastAPI will run on
EXPOSE 8000

# Start FastAPI with Gunicorn and Uvicorn worker
CMD ["gunicorn", "main:app", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "--bind", "0.0.0.0:8000"]
