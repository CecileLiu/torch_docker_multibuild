# syntax=docker/dockerfile:1
FROM python:3.10-slim AS compile-image

# Install dependencies in one layer to reduce image size
RUN apt-get update && \
    apt-get install -y --no-install-recommends git libpq-dev libevdev-dev python3-dev gcc build-essential && \
    apt-get install -y libgl1-mesa-glx libglib2.0-0 libgl1 ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /home/app

# Create a virtual environment in the user's home directory
RUN python -m venv /home/app/venv
ENV PATH="/home/app/venv/bin:$PATH"

# Copy only the necessary files for installation
COPY requirements.txt ./

# Upgrade pip and install dependencies
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install jupyter notebook && \
    pip install --upgrade pip 

# Final stage
FROM python:3.10-slim AS build-image

# Set the working directory
WORKDIR /home/app

RUN apt-get update

# Copy the virtual environment from the compile stage
COPY --from=compile-image /home/app/venv ./venv
ENV PATH="/home/app/venv/bin:$PATH"
