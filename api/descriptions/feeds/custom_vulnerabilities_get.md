Retrieves the list of custom vulnerabilities and associated rules for handling internally created or packaged apps.

This list is used by the Twistlock scanner to detect vulnerable custom components (apps, libraries, etc) that were developed and packaged internally.

**Note:** When a vulnerable custom component is detected in an image, you must have a rule to tell Twistlock how to handle it. Vulnerability rules can be created using the Console UI or with the /api/v1/policies/cve endpoint. To set a vulnerability rule to ignore, alert, or block, use the rule ID `412` to indicate the image contains vulnerable custom components. See `/api/v1/policies/cve` endpoint for more info.

### cURL Request

The following cURL command retrieves a list of all the custom vulnerabilities and associated rules:

**Note:** The cURL will require you to enter the user's password after submission.

```bash
$ curl -k \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -X GET \
  https://<CONSOLE>/api/v1/feeds/custom/custom-vulnerabilities
```

### Response

A successful response will return a list of custom vulnerability rules and the associated digest:

```json
{
	"_id":"customVulnerabilities",
	"rules": [
		{
	      "_id": "<ID>",
	      "package": "internal-lib",
	      "type": "package",
	      "minVersionInclusive": "1.1",
	      "name": "internal-lib",
	      "maxVersionInclusive": "1.8",
	      "md5": ""
	    }
	],
	"digest":"<DIGEST>"
}
```
