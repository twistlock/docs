Retrieves the registry's webhook URL suffix and the list of registries Prisma Cloud is configured to scan.

This endpoint maps to the following information on the **Defend > Vulnerabilities > Images > Registry settings** Console UI page:

* Item **b** under **Webhooks** (the URL suffix).
* **Registries** table data

### cURL Request

The following cURL command retrieves the URL suffix for the code repository webhook and retrieves all code repositories to scan.

```bash
$ curl -k \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -X GET \
  'https://<CONSOLE>/api/v1/settings/registry'
```
