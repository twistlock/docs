Updates the scopes used for pattern matching on serverless function.
All registries to scan are updated in a single shot.

To invoke this endpoint in the Console UI:

1. Navigate to **Defend > Vulnerabilities > Functions > Functions**.
2. Under the **Function scope** table, add a registry item using **+ Add scope**

	**Note:** If the table is not present, use the **Add the first item** link.

3. Click the **Save** button.

### cURL Request

The following cURL command replaces all scopes with a new single scope.

```bash
$ curl 'https://<CONSOLE>/api/v1/settings/serverless-scan' \
  -k \
  -X POST \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
  '[
      {
        "provider": "aws",
        "region":"us-east-1",
        "pattern":"test",
        "credential":{},
        "credentialID":"IAM Role"
      }
    ]'
```

**Note:** No response will be returned upon successful execution.