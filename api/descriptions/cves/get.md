Retrieves CVEs from Twistlock's vulnernability database.
Query the database by CVE ID.
Partial matches are supported.
A null response indicates that the CVE is not in our database.

The following example curl command queries the Twistlock database for CVE-2018-1102.

```bash
$ curl -k \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -X GET \
  https://<CONSOLE>:8083/api/v1/cves?id=CVE-2018-1102
```
