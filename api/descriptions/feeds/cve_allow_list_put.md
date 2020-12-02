Globally whitelists a set of Custom Vulnerability Environments (CVEs).

**Note:** Any previously installed lists are overwritten.

### cURL Request

The following cURL command installs a list of globally whitelisted CVEs.

```bash
$ curl -k \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -X PUT \
  -d \
'{
  "rules": [
    {
      "cve": "CVE-2018-2222",
      "expiration": "2020-06-18T00:00:00Z"
    }
  ]
}' \
  https://<CONSOLE>/api/v1/feeds/custom/cve-allow-list
```

**Note:** No response will be returned upon successful execution.

To confirm the CVEs have been added to the global whitelist, invoke the `GET /api/v1/feeds/custom/cve-allow-list` endpoint.

