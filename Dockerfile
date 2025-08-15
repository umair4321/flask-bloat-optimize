# Use a lightweight Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Expose port
EXPOSE 5000

# Start with Gunicorn (better than Flask's dev server)
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]

