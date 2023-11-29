# Use the official Nginx image as the base image
FROM nginx:latest

# Remove the default Nginx configuration
RUN rm -v /etc/nginx/nginx.conf

# Copy your custom Nginx configuration file
COPY nginx.conf /etc/nginx/

# Set the working directory to the Nginx web root
WORKDIR /usr/share/nginx/html

# Copy the contents of your frontend app to the container
COPY build/web .
COPY server-cert.crt /etc/nginx/
COPY server-cert.key /etc/nginx/

# Expose the port on which Nginx will listen
EXPOSE 443

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]