Updates the scopes used for pattern matching on the serverless function Prisma Cloud is configured to scan.
All scopes to scan are updated in a single shot.

To invoke this endpoint in the Console UI:

1. Navigate to **Defend > Vulnerabilities > Functions > Functions**.
2. Under the **Function scope** table, add a registry item using **+ Add scope**

	**Note:** If the table is not present, use the **Add the first item** link.

3. Click the **Save** button.


### General Set up and Scan Process

This endpoint works hand-in-hand with the `/policies` endpoints.

**To set up a scope for serverless scanning:**

1. Add your scope information using this endpoint.

   For example, specify the pattern scope(s) and credentials of your GitHub account.

2. Prisma Cloud auto-discovers the serverless functions specified with this endpoint.

   The system invokes the GET `/serverless` endpoint to discover the available scopes using the credential ID provided.

3. The list of auto-discovered serverless functions is passed to the scanner for evaluation.
  
   The scanner uses the corresponding `/policies/vulnerability/serverless` endpoint to assess each code repository.

### cURL Request

Each serverless function is specified as an element within the endpoint's payload array. The functions for each scope are specified as separate objects.

The critical fields for this endpoint are:

* `provider` - Host provider name. For example, `aws` refers to Amazon Web Services.
* `pattern` - Text pattern to use for the scan. The pattern is compared against the resource names.
* `credentialID` - ID of the credentials in the credentials store to authenticate against the service provider.

The following cURL command overwrites all serverless scan scopes to scan with a new single serverless scan scope.

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
        "pattern":"Ubuntu",
        "credential":{},
        "credentialID":"IAM Role"
      }
    ]'
```

**Note:** No response will be returned upon successful execution.