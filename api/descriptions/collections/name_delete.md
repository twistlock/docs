Deletes a collection.

To invoke this endpoint in the Console UI:

1. Navigate to **Manage > Collections and Tags > Collections**.
2. Click the dotted icon under the **Actions** column to open up the menu options. **Note:** The default collections do not have a dotted icon in the **Actions** column.
3. Click the **Delete** button to initiate the deletion. 
4. Click the **Delete Collection** button to confirm the deletion.

### cURL Request

The following cURL command deletes a collection.

**Note:** Spaces are considered [unsafe characters in a URL](https://www.ietf.org/rfc/rfc1738.txt) so they must be encoded with the value `%20`.

```bash
$ curl -k \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -X DELETE \
  'https://<CONSOLE>/api/v1/collections/<COLLECTION NAME>'
```

**Note:** No response will be returned upon successful execution.
