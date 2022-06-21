# cf-jaeger-all-in-one

> very simple setup in-mem jaeger on `cloud foundry`

## Setup

```bash
bash download_jaeger.sh
cf push
```


## multi port 

```bash
DOMAIN= # set your cloud foundry domain, use 'cf domains' to check that
APP_GUID=$(cf app jaeger-all-in-one --guid)
cf curl /v2/apps/$APP_GUID -X PUT -d '{"ports": [8080, 4318]}' 
cf create-route $DOMAIN --hostname jaeger-all-in-one-otlp # hostname should be unique
ROUTE_GUID=$(cf curl '/v2/routes?q=host:jaeger-all-in-one-otlp' | jq -r '.resources[0].metadata.guid')
cf curl /v2/route_mappings -X POST -d "{\"app_guid\": \"$APP_GUID\", \"route_guid\": \"$ROUTE_GUID\", \"app_port\": 4318 }"
```