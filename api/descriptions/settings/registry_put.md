Updates the registries to scan.
All registries to scan are updated in a single shot.

To invoke this endpoint in the Console UI:

1. Navigate to **Defend > Vulnerabilities > Images > Registry settings**.
2. Under the **Registries** table, add a registry item using **+ Add registry**
3. Click the **Save** button.

### cURL Request

Each registry to scan is specified as an item in the `specifications` array.

The following cURL command overwrites all registries to scan with two new registries.
It configures Prisma Cloud to scan the Ubuntu 18.04 and Alpine 3.10 images in Docker Hub.

```bash
$ curl 'https://<CONSOLE>/api/v1/settings/registry' \
  -k \
  -X PUT \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
  '{
    "specifications": [
      {
        "version": "2",
        "registry": "",
        "repository": "library/ubuntu",
        "tag": "18.04",
        "os": "linux",
        "cap": 5,
        "hostname": "",
        "scanners": 2
      },
      {
        "version": "2",
        "registry": "",
        "repository": "library/alpine",
        "tag": "3.10",
        "os": "linux",
        "cap": 5,
        "hostname": "",
        "scanners": 2
      }
    ]
  }'
```

**Note:** No response will be returned upon successful execution.

### Remove a Registry

To remove a registry from the list:

1. Retrieve the current list using the GET method.
2. Remove the entry from the `specifications` JSON array in the response.
3. Use the PUT method to submit the updated JSON object.

To delete all entries, submit an empty `specifications` array. For example:

```bash
curl -k \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -X PUT \
  -d '{"specifications":[]}' \
  https://<CONSOLE>/api/v1/settings/registry
```
