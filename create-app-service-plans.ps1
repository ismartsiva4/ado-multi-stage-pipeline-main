az appservice plan create \
--name plan-dev \
--resource-group webapps-rg \
--sku B1 \
--is-linux

az appservice plan create \
--name plan-qa \
--resource-group webapps-rg \
--sku B1 \
--is-linux

az appservice plan create \
--name plan-prod \
--resource-group webapps-rg \
--sku S1 \
--is-linux
