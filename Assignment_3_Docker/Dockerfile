# Use Python 3.10.13 as a parent image
FROM python:3.10.13-slim

# Set the working directory in the container to /app
WORKDIR /app

# Set up a virtual environment in the /app/venv directory
RUN python -m venv venv

# Activate the virtual environment
RUN . venv/bin/activate

# Copy the requirements.txt file into the container at /app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN /app/venv/bin/pip install --no-cache-dir -r requirements.txt

# Copy the main.py file into the container at /app
COPY main.py .

# Run main.py when the container launches, within the virtual environment
CMD ["venv/bin/python", "main.py"]
