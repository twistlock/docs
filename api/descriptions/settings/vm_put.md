Updates the VM images to scan.
All VM images to scan are updated in a single shot.

To invoke this endpoint in the Console UI:

1. Navigate to **Defend > Vulnerabilities > Hosts > VM images**.
2. Under the **VM images scope** table, add a registry item using **+ Add scope**.

	**Note:** If the **+ Add scope** button is not present, use the **Add the first item** link.

3. Click the **Save** button.

### cURL Request

The following cURL command replaces all scopes with a new single scope.

```bash
$ curl 'https://<CONSOLE>/api/v1/settings/vm' \
  -k \
  -X PUT \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
  '[
      {
        "version": "2",
        "cap": 5,
        "scanners": 1,
        "collections":[{"name":"All"}],
        "credentialID":"IAM Role",
        "consoleAddr":"https://10.0.2.15:8083"
      }
    ]'
```

**Note:** No response will be returned upon successful execution.
