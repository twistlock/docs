Updates the list of VM images (scopes) to scan.
The list of VM images to scan are updated in a single shot.

To invoke this endpoint in the Console UI:

1. Navigate to **Defend > Vulnerabilities > Hosts > VM images**.
2. Under the **VM images scope** table, add a registry item using **+ Add scope**.

	**Note:** If the **+ Add scope** button is not present, use the **Add the first item** link.

3. Click the **Save** button.

### General Set up and Scan Process

This endpoint works hand-in-hand with the `/policies` endpoints.

**To set up a VM image for scanning:**

1. Add your VM image information using this endpoint.

   For example, specify the VM image name(s) and credentials of your GitHub account.

2. Prisma Cloud auto-discovers the VM images specified with this endpoint.

   The system invokes the GET `/vms` endpoint to discover the available VM images using the credential ID provided.

3. The list of auto-discovered VM images is passed to the scanner for evaluation.
  
   The scanner uses the corresponding `/policies/vulnerability/vms` endpoint to assess each VM image.

### cURL Request

Each VM image scope item is specified as an element within the endpoint's payload array. The VM images for each scope are specified within the scope's `collections` array.

The critical fields for this endpoint are:

* `collections` - Collection names to scan.
* `credentialID` - ID of the credentials in the credentials store to authenticate against the service provider.

The following cURL command overwrites all VM image scopes to scan with a new single VM image scope.

```bash
$ curl 'https://<CONSOLE>/api/v1/settings/vm' \
  -k \
  -X PUT \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
  '[
      {
        "version": "aws",
        "cap": 5,
        "scanners": 1,
        "collections":[{"name":"All"}],
        "credentialID":"IAM Role",
        "consoleAddr":"https://localhost:8083"
      }
    ]'
```

**Note:** No response will be returned upon successful execution.
