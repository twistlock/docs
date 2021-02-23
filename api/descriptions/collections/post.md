Creates a new collection for use in rules and views across the product.

To invoke this endpoint in the Console UI:

1. Navigate to **Manage > Collections and Tags > Collections**.
2. Add a collection using **+ Add collection**.
3. Click the **Save** button.

### cURL Request

The following cURL command creates a new collection named `my-collection`.
This collection captures all container images named `ubuntu:18.04`.

```bash
$ curl 'https://<CONSOLE>/api/v1/collections' \
  -k \
  -X POST \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
'{
   "name":"my-collection",
   "accountIDs":["*"],
   "appIDs":["*"],
   "clusters":["*"],
   "codeRepos":["*"],
   "containers":["*"],
   "functions":["*"],
   "hosts":["*"],
   "images":["ubuntu:18.04"],
   "labels":["*"],
   "namespaces":["*"]
}'
```

**Note:** No response will be returned upon successful execution.