Updates the code repositories to scan.
All code repositories to scan are updated in a single shot.

To invoke this endpoint in the Console UI:

1. Navigate to **Defend > Vulnerabilities > Code repositories**.
2. Under the **GitHub repositories scan scope** table, add a scope item using **+ Add scope**
	
	**Note:** If your table is not present add an item to the table by clicking **Add the first item**.

3. Click the **Save** button.

### cURL Request

The following cURL command overwrites all code repositories to scan with a new single code repository.

```bash
$ curl 'https://<CONSOLE>/api/v1/settings/coderepos' \
  -k \
  -X PUT \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
'[
   {
      "repositories":[
         "*"
      ],
      "type":"github",
      "credentialID":"<CREDENTIAL_ID>",
      "id":<UNIQUE_ID>
   }
]'
```

**Note:** No response will be returned upon successful execution.
