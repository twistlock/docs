Retrieves the VM image scopes to scan.

This endpoint maps to the **VM images scope** table data in the **Defend > Vulnerabilities > Hosts > VM images** Console UI.

### cURL Request

The following cURL command retrieves the scopes used for pattern matching on serverless functions.

```bash
$ curl -k \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -X GET \
  'https://<CONSOLE>/api/v1/settings/vm'
```
