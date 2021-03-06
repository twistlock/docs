Deletes an existing list of custom rules in the runtime policy.

To invoke this endpoint in the Console UI:

1. Navigate to the **Defend > Runtime > Network lists** page.
2. Locate an existing list in the table to delete and click on the tashcan icon in the **Actions** columns.
3. Click **Delete Network List** to confirm the deletion.

### cURL Request

The following cURL command adds a new network list.

```bash
$ curl 'https://<CONSOLE>/api/v1/policies/firewall/app/custom-rules/{id}' \
  -k \
  -X DELETE \
  -u <USER>
```

​**Note:** No response will be returned upon successful execution.
