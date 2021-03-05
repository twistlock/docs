Retrieves the scopes used for pattern matching on the serverless functions Prisma Cloud is configured to scan.

This endpoint maps to the **Function scope** table data in the **Defend > Vulnerabilities > Functions > Functions** Console UI.

### cURL Request

The following cURL command retrieves the scopes used for pattern matching on serverless functions.

```bash
$ curl -k \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -X GET \
  'https://<CONSOLE>/api/v1/settings/serverless-scan'
```
