Creates a new collection for use in rules and views across the product.

To invoke this endpoint in the Console UI:

1. Navigate to **Manage > Collections and Tags > Collections**.
2. Add a collection using **+ Add collection**.
3. Click the **Save** button.

### cURL Request

The following cURL command creates a new collection.

```bash
$ curl 'https://<CONSOLE>/api/v1/collections' \
  -k \
  -X POST \
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