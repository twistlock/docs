Retrieves the list of code repositories Prisma Cloud is configured to scan. 
It also retrieves a partial webhook URL.

This endpoint maps to the following information on the **Defend > Vulnerabilities > Code repositories** Console UI page:

* Item #2 under **Webhook settings** (the URL suffix)
* **GitHub repositories scan scope** table data

### Webhook

You can optionally configure your code repositories with a webhook to trigger Prisma Cloud to scan repositories when there is a pertinent event (e.g., new code is pushed to the repository).

Construct the full webhook using the publicly accessible DNS name or IP address, plus the webhook URL suffix.

### cURL Request

The following cURL command retrieves all the code repositories to scan and the URL suffix for the repositories.

```bash
$ curl -k \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -X GET \
  'https://<CONSOLE>/api/v1/settings/coderepos'
```