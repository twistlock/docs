Retrieves the digest string for the Custom Vulnerability Environment (CVE) allow lists configured in Console.

### cURL Request

The following cURL command retrieves the digest for the configured CVE.

**Note:** The cURL will require you to enter the user's password after submission.

```bash
$ curl -k \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -X GET \
  https://<CONSOLE>/api/v1/feeds/custom/cve-allow-list/digest
```

A successful response will return the digest string. This is the same value as the `digest` property in the response of the `GET api/v1/feeds/custom/cve-allow-list` endpoint.

