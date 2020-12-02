Retrieves the list of globally whitelisted Custom Vulnerability Environments (CVEs).

### cURL Request

The following cURL command retrieves the list of globally whitelisted CVEs.

**Note:** The cURL will require you to enter the user's password after submission.

```bash
$ curl -k \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -X GET \
  https://<CONSOLE>/api/v1/feeds/custom/cve-allow-list
```

### Response

A successful response will return a list of CVEs that will be used for global whitelisting.

```json
{
	"_id":"cveAllowList",
	"rules": [
		{
			"cve": "CVE-2018-2222",
			"expiration": "2020-06-18T00:00:00Z"
		}
	],
	"digest":"<DIGEST>"
}
```
