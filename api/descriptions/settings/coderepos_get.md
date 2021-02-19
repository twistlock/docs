Retrieves the code repository's webhook URL suffix and the code repositories to scan.

This endpoint maps to the following information on the **Defend > Vulnerabilities > Code repositories** Console UI page:

* Item #2 under **Webhook settings** (the URL suffix).
* **GitHub repositories scan scope** table data

### cURL Request

The following cURL command retrieves the URL suffix for the code repository webhook and retrieves all code repositories to scan.

```bash
$ curl -k \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -X GET \
  'https://<CONSOLE>/api/v1/settings/coderepos'
```
