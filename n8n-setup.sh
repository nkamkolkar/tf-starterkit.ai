
# Run this as n8n-service account
# Clone repo and run the services 

su - n8n-service

# Now, as the n8n-service user
cd /opt/n8n-deployment 
git clone https://github.com/n8n-io/n8n-ai-starter-kit.git .
docker-compose up -d
