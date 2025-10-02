# Step 1: Base image
FROM python:3.10-slim

# Step 2: Set working directory
WORKDIR /app

# Step 3: Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Step 4: Copy application source
COPY . .

# Step 5: Expose Flask port
EXPOSE 5000

# Step 6: Start app
CMD ["python", "app.py"]