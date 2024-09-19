# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Install Nginx and Supervisor
RUN apt-get update && apt-get install -y \
    nginx \
    supervisor && \
    rm -rf /var/lib/apt/lists/*

# Install Streamlit
RUN pip install https://core-previews.s3-us-west-2.amazonaws.com/pr-9500/streamlit-1.38.0-py2.py3-none-any.whl

# Remove default Nginx configuration
RUN rm /etc/nginx/sites-enabled/default

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY streamlit_proxy.conf /etc/nginx/conf.d/streamlit_proxy.conf

# Copy Supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Copy Streamlit apps
COPY app1.py /app/app1.py
COPY app2.py /app/app2.py

# Expose ports
EXPOSE 80

# Set the working directory
WORKDIR /app

# Command to run Supervisor, which will start Nginx and the Streamlit apps
CMD ["/usr/bin/supervisord", "-n"]
