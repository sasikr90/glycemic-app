# Use official nginx image based on Alpine
FROM nginx:alpine

# Update Alpine packages inside the image to pull security fixes
# apk update   -> refresh package index
# apk upgrade  -> upgrade installed packages to latest available versions
# --no-cache   -> avoid storing package cache and keep image smaller
RUN apk update && apk upgrade --no-cache

# Copy your application file into nginx web root
# This replaces the default nginx landing page with your index.html
COPY index.html /usr/share/nginx/html/index.html

# Document that the container listens on port 80
# This is informational for Docker and helps readability
EXPOSE 80

# Start nginx in foreground mode
# Containers should keep the main process in foreground, otherwise container exits
CMD ["nginx", "-g", "daemon off;"]