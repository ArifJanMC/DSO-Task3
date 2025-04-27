#!/bin/bash

# Renew certificates
sudo certbot renew --quiet

# Copy new certificates to the project directory
sudo cp /etc/letsencrypt/live/dot.arifjan.su/fullchain.pem ./certs/
sudo cp /etc/letsencrypt/live/dot.arifjan.su/privkey.pem ./certs/
sudo chmod 644 ./certs/fullchain.pem ./certs/privkey.pem

# Restart services to apply new certificates
docker-compose restart nginx
docker-compose -f gitlab-compose.yml restart gitlab
