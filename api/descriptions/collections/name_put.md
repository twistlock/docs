Updates the parameters for a specific collection.

To invoke this endpoint in the Console UI:

1. Navigate to **Manage > Collections and Tags > Collections**.
2. Click the dotted icon under the **Actions** column to open up the menu options. **Note:** The default collections do not have a dotted icon in the **Actions** column. Use the  **Manage** cog icon to open the update window.
3. Click the **Manage** button and update the collection's parameters. 
4. Click the **Save** button to save the changes.

**Note:** You must define or redefine all parameters in the PUT request. Any parameter left unspecified is set to an empty string.

### cURL Request

The following cURL command updates a collection.

```bash
$ curl 'https://<CONSOLE>/api/v1/collections/<COLLECTION NAME>' \
  -k \
  -X PUT \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
'{
   "name":"<COLLECTION_NAME>",
   "<ENTITY_NAME>":[
      "*"
   ]
}'
```

**Note:** No response will be returned upon successful execution.
