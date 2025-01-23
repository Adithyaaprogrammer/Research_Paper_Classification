# Use an official Python image as a base
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and the code into the container
COPY requirements.txt /app/requirements.txt
COPY rag_implementation.py /app/rag_implementation.py
COPY predictions.csv /app/predictions.csv

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install additional system dependencies for PyPDF2 and nltk
RUN apt-get update && apt-get install -y \
    libxml2-dev libxslt-dev libz-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download NLTK stopwords
RUN python -c "import nltk; nltk.download('punkt'); nltk.download('stopwords')"

# Expose a port for debugging (if necessary)
EXPOSE 8000

# Command to run the application
CMD ["python", "rag_implementation.py"]
