# Step 1: Base image
FROM nginx:alpine

# Step 2: Copy static website files to nginx html directory
COPY ./html /usr/share/nginx/html

# Step 3: Expose HTTP port
EXPOSE 80

# Step 4: Default command (from nginx image)
CMD ["nginx", "-g", "daemon off;"]