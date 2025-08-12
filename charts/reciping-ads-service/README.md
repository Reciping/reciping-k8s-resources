# reciping-ads-service Helm Chart

## Required secrets
- `secrets.jwtSecretKeyBase64`: Base64-encoded JWT key
- `database.url`, `database.username`, `database.password`
- `secrets.awsAccessKeyId`, `secrets.awsSecretAccessKey` (required by current app code)

## Important values
- `env.USER_SERVICE_URL`: URL for user service
- `metrics.prometheus.*`: Prometheus scraping path/port and PodMonitor enablement
- `ingress.preserveAuthorizationHeader`: keep JWT headers through ingress