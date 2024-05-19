az webapp create \
--name webapp-1-dev
--resource-group webapps-rg \
--plan plan-dev \
--runtime "PHP|8.2"

az webapp create \
--name webapp-2-qa  
--resource-group webapps-rg \
--plan plan-qa \
--runtime "PHP|8.2"

az webapp create \
--name webapp-3-prod
--resource-group webapps-rg \
--plan plan-prod \
--runtime "PHP|8.2"
